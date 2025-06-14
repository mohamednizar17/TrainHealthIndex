# Indian Railways AI-Powered Health Index

A web application for real-time train health monitoring and AI-driven insights, built with HTML, JavaScript, TailwindCSS, Leaflet, Chart.js, jQuery, and Font Awesome. It processes train data from `train_max_distance_only.json` to provide train health scores, route analysis, and personalized features.

## Features
- **Train Health Index (THI)**: 0-100 score based on mock sensor data and route distance, with maintenance recommendations.
- **AI Insights**: 120+ real-time features:
  - Route analysis (e.g., distance classification, fuel estimates).
  - Train categorization (e.g., express, luxury, commuter).
  - Predictive maintenance (e.g., wheel wear, brake failure).
  - Personalization (e.g., route/distance preferences).
  - Sentiment analysis for user feedback.
- **Train Schedule**: Displays source and destination stations with distances.
- **Route Map**: Interactive map with mock coordinates for source/destination.
- **Favorites**: Add/remove favorite trains.
- **Authentication**: Client-side login/register using localStorage.
- **Feedback**: Collects feedback with sentiment and topic analysis.
- **Export**: Downloads JSON reports with train details and AI insights.
- **UI/UX**: Train-themed background, glassmorphism, animations, tooltips, centered auth section.

## Prerequisites
- Web browser (e.g., Chrome, Firefox).
- Local server (e.g., Python's `http.server` or Node.js `http-server`).
- `train_max_distance_only.json` with fields: `Train No`, `Train Name`, `Distance`, `Source Station`, `Source Station Name`, `Destination Station`, `Destination Station Name`.

## Installation
1. Clone or download the repository:
   ```bash
   git clone <repository-url>
   ```
2. Create a `data` folder and place `train_max_distance_only.json` inside:
   ```
   project/
   ├── data/
   │   └── train_max_distance_only.json
   ├── index.html
   └── README.md
   ```
3. Start a local server:
   ```bash
   python -m http.server 8000
   ```
   Or use Node.js:
   ```bash
   npm install -g http-server
   http-server .
   ```
4. Open `http://localhost:8000` in your browser.

## Usage
1. **Register/Login**:
   - Use the centered login/register section to create an account or log in (stored in localStorage).
2. **Search Train**:
   - Enter a train number (e.g., `10103`) in the input field.
   - Use autocomplete suggestions for valid trains.
   - Click "Get Health Index" to view details.
3. **View Insights**:
   - **Schedule**: Source and destination stations with distance.
   - **THI & Sensors**: Real-time THI score and mock sensor data (updated every 5 seconds).
   - **AI Features**: Explore 120+ insights via the "AI Features" button or maintenance section.
   - **Route Map**: See source/destination on an interactive map.
   - **Favorites**: Add/remove trains to your favorites list.
4. **Feedback**:
   - Submit feedback in the "Contact Us" section to see sentiment analysis.
5. **Export**:
   - Click "Export Report" to download a JSON report with train details and AI insights.
6. **Customize**:
   - Toggle dark mode or sound (train audio) using header buttons.

## Project Structure
```
project/
├── data/
│   └── train_max_distance_only.json  # Train data
├── index.html                       # Main HTML file with JS and CSS
└── README.md                        # Project documentation
```

## JSON Format
`train_max_distance_only.json` should contain:
```json
[
  {
    "Train No": "10103",
    "Train Name": "Mandovi Express",
    "Distance": 765,
    "Source Station": "CSMT",
    "Source Station Name": "Chhatrapati Shivaji Maharaj Terminus",
    "Destination Station": "MAO",
    "Destination Station Name": "Madgaon"
  },
  ...
]
```

## Limitations
- Mock sensor data used for THI; real sensors needed for accuracy.
- Mock coordinates in route map; real lat/lon data required.
- Client-side authentication is insecure for production.
- 120+ AI features may impact performance on low-end devices.
- JSON file must be in `data` folder and accessible via server.

## Future Enhancements
- Integrate real sensor data for precise THI calculations.
- Add real station coordinates for accurate route mapping.
- Implement a backend for secure authentication and feedback storage.
- Optimize AI features for better performance.
- Support multilingual UI and accessibility.

## Troubleshooting
- **JSON Not Loading**: Ensure `train_max_distance_only.json` is in `data/` and the server is running. Check browser console for errors.
- **CORS Issues**: Use a local server instead of opening `index.html` directly.
- **Slow Performance**: Reduce AI feature updates (edit `setInterval` in `index.html`).

## Contributing
1. Fork the repository.
2. Create a feature branch (`git checkout -b feature-name`).
3. Commit changes (`git commit -m "Add feature"`).
4. Push to the branch (`git push origin feature-name`).
5. Open a pull request.

## License
MIT License. See [LICENSE](LICENSE) for details.

## Contact
For feedback or issues, use the in-app "Contact Us" section or email [contact@irhealthindex.in](mailto:contact@irhealthindex.in).
