Project Setup Instructions

1. Clone the Repository:

        (https://github.com/aframubu/project_zylentrix)

2. Install Dependencies:

        flutter pub get

3. Run the Application:

       For Android:

       flutter run

4. Generate Launcher Icons (if applicable):

      flutter pub run flutter_launcher_icons:main

5.Features Implemented

      Splash Screen: Displays a loading screen before navigating to the main content.

      API Integration: Fetches posts from https://jsonplaceholder.typicode.com/posts.

      Post List Screen: Displays a list of posts with a refresh button.

      Post Detail Screen: Shows detailed information about a selected post.

      Error Handling: Displays an error message if data fetching fails.

      Loading Indicator: Shows a progress indicator while fetching data.

      Navigation: Users can navigate between screens smoothly.

6. Assumptions & Additional Enhancements

      The app assumes the user has an active internet connection to fetch posts.

      A simple UI with ListView and Card widgets for better readability.

      Implemented Future.delayed() to simulate a splash screen transition.

      Added a refresh button to manually reload posts from the API.

      Basic error handling to inform the user in case of a failure.
