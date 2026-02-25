# Indian Railways AI-Powered Health Index - Setup Guide

## Overview
This project has been restructured with:
- ✅ Separate login/register page with security
- ✅ Session-based authentication & protection
- ✅ Google Maps integration with auto-routing
- ✅ Secure password hashing (bcryptjs)
- ✅ Rate limiting & CSRF protection

---

## File Structure
```
THI/
├── login.html              # Login & Registration (REDIRECT HERE FIRST)
├── index.html              # Main Dashboard (Protected)
├── train_max_distance_only.json  # Train data
└── README.md              # This file
```

---

## ⚠️ IMPORTANT SETUP STEPS

### 0. Start Local Server (REQUIRED)

**Why?** Browsers block file:// protocol access to JSON files for security. You must run a local server.

**Option A (Easiest - Windows):**
1. Double-click `start_server.bat` in the THI folder
2. Wait for: "Serving HTTP on 0.0.0.0 port 8000"
3. Open browser: `http://localhost:8000/login.html`

**Option B (Command Line - Windows/Mac/Linux):**
```bash
cd path/to/THI
python -m http.server 8000
```
Then visit: `http://localhost:8000/login.html`

**Option C (Alternative - Use Live Server in VS Code):**
1. Install "Live Server" extension
2. Right-click `login.html` → "Open with Live Server"

---

### 1. Get Google Maps API Key
Since Google Maps requires authentication, you need to replace the demo key:

**Steps:**
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project
3. Enable these APIs:
   - Google Maps JavaScript API
   - Directions API
   - Places API
4. Create an API Key (restriction: HTTP referrers)
5. Copy your API key

**Update in `index.html` (Line with Google Maps script):**
```html
<script async defer src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY_HERE&libraries=places,routes&callback=initializeGoogleMaps"></script>
```
*Note: Use `loading=async` and valid libraries only (no "directions")*

### 2. Security Features Implemented

#### Password Security:
- Bcryptjs hashing (10 rounds)
- Minimum 8 characters
- Must contain: uppercase letter + number
- Client-side encryption (production should add server-side)

#### Session Management:
- 1-hour session timeout
- Session tokens in sessionStorage
- "Remember Me" option (encrypted in localStorage)
- Automatic logout on session expiration

#### Rate Limiting:
- Max 5 login attempts per 15 minutes
- Prevents brute-force attacks

---

## 🔐 Authentication Flow

```
login.html (User lands here)
    ↓
Registration: Hash password + Save to localStorage
    ↓
Login: Compare with hashed password
    ↓
Create session token → sessionStorage
    ↓
Redirect to index.html
    ↓
checkAuthentication() validates token
    ↓
Access granted! View dashboard
```

---

## 🗺️ Google Maps Features

### Auto-Mapping:
- Source station → automatically located
- Destination station → automatically located
- Waypoints → All intermediate stations
- Directions API → Shows optimal route with distances & durations

### Train Station Coordinates:
The app includes real Indian Railway station coordinates:
- CSMT (Mumbai)
- MAO (Madgaon)
- ERS (Ernakulam)
- BRC (Vadodara)
- NDLS (New Delhi)
- And more...

You can add more stations in the `RAILWAY_STATIONS` object in index.html.

### Map Display:
1. User selects a train
2. System fetches source & destination
3. Google Directions API calculates route
4. Shows:
   - Route path (blue line)
   - Station markers (numbered)
   - Directions panel with distances & times

---

## 📱 Testing the App

### Step 1: Start Local Server (REQUIRED!)
1. Double-click `start_server.bat` in the THI folder
   - OR in terminal: `python -m http.server 8000`
2. Wait for: "Serving HTTP on 0.0.0.0 port 8000"

### Step 2: Open the App
- Visit: `http://localhost:8000/login.html`
- You should see the login page

### Step 3: Create Account
1. Click "Register here"
2. Create account with password example: `TestPass123` (8+ chars, uppercase + number)
3. Click "Login here"
4. Sign in → redirected to dashboard

### Step 4: Try Features
1. **Select Train:** Enter number like `10103` or `10104`
2. **View Map:** Click "Get Health Index" → Google Maps displays route
3. **Logout:** Click top-right logout button

---

## 🚀 Routing & Navigation

### Login Flow:
```
login.html
├── Existing user → Sign in → index.html
├── New user → Register → Confirm → Sign in → index.html
└── Session exists → Auto-redirect to index.html
```

### Main Dashboard (index.html):
- **Protected page** - Redirect to login if session invalid
- **Logout button** - Top right, clears session
- **Session display** - Shows username & welcome message
- **Auto-map** - Train selection → Automatic route display

---

## 🔧 Customization

### Add More Train Stations:
```javascript
// In index.html, find RAILWAY_STATIONS object
const RAILWAY_STATIONS = {
    'CODE': { lat: 18.9676, lng: 72.8194, name: 'Station Name', fullName: 'Full Name' },
    // Add more...
};
```

### Change Session Timeout:
```javascript
// In index.html
const SESSION_TIMEOUT = 3600000; // 1 hour in milliseconds
```

### Modify Security Settings:
```javascript
// In login.html
const BCRYPT_ROUNDS = 10;           // Password hash rounds
const MAX_LOGIN_ATTEMPTS = 5;       // Failed attempts before lockout
const RATE_LIMIT_WINDOW = 900000;   // 15 minutes
```

---

## ⚡ Known Limitations

1. **Client-side storage only** - Use proper backend for production
2. **Passwords stored in localStorage** - Use secure backend API
3. **No HTTPS** - Use HTTPS in production
4. **API key exposed** - Restrict in Google Cloud Console
5. **Demo stations** - Add actual station coordinates as needed

---

## 🐛 Troubleshooting

### "Failed to fetch train data" error?
**Solution:** You MUST run a local server (see Step 0 above)
- ❌ Don't: Open `index.html` directly (file:// protocol)
- ✅ Do: Run `start_server.bat` and visit `http://localhost:8000/login.html`

### Map not showing?
- Check Google Maps API key is correct
- Verify API is enabled in Google Cloud Console
- Check browser console for errors
- Ensure you're on `http://localhost` (not file://)

### Login not working?
- Ensure password meets requirements (8+ chars, uppercase, number)
- Check localStorage for existing users
- Clear browser cache if issues persist
- Wait 2 seconds for bcryptjs library to fully load

### Routes not calculating?
- Verify train stations exist in RAILWAY_STATIONS object
- Check if coordinates are accurate
- Confirm Directions API is enabled
- Check browser console for detailed errors

---

## 📊 Data Flow

```
User Login
    ↓
Bcrypt password verification
    ↓
Session token created
    ↓
Stored in sessionStorage
    ↓
Dashboard loaded with user prefs
    ↓
User selects train
    ↓
Fetch train data from JSON
    ↓
Query Google Maps Directions API
    ↓
Display route with waypoints
    ↓
Show real-time sensor analytics
```

---

## 🔐 Security Checklist

- ✅ Password hashing (bcryptjs)
- ✅ Rate limiting (5 attempts per 15 min)
- ✅ Session timeout (1 hour)
- ✅ Secure tokens (crypto.getRandomValues)
- ✅ CSRF token validation
- ⚠️ TODO: Backend API encryption
- ⚠️ TODO: HTTPS only
- ⚠️ TODO: Database instead of localStorage

---

## 📝 Notes

- JSON file path: `train_max_distance_only.json` (update if location changes)
- Train data loaded on dashboard init
- Favorites saved to localStorage
- User preferences also in localStorage
- Feedback with sentiment analysis

**For production:** Implement proper backend authentication server with:
- HTTPS
- JWT tokens
- Database encryption
- Rate limiting at server level
- CORS protection

---

Created: 2026-02-25
Version: 2.0 (Security & Maps Update)
