# Wakely

This is a Swift Application that seeks to revolutionize the way you sleep and wake up. Aside from being a simple weather application, it has an alarm clock function as well as a music player. 

## Weather Function

The Weather Application uses Swift's CoreLocation library to grab the user's location and then does geolocation to figure out the user's location in (latitude and longitude coordinates).

## Alark Clock Function

The Alarm clock function allows you to input the number of seconds to sleep. When the time is up, a tune is played matching the atmosphere of the weather. Here is the playlist which is subject to change in a future iteration:

1. Raining: Rihanna's Umbrella
2. Cloudy: Simon and Garfunkel's Cloudy
3. Sunny: Natasha Bedingfield's Pocket of Sunshine
4. Snow: Frank Sinatra's Let it Snow
5. Clear Night: Toploader's Dancing in the Moonlight
6. Windy: Colors of the Wind (Pocohontas)
7. Fog: Train's When the Fog Rolls In

## Music Player

The Music player function allows users to choose a a genre of music that will help with sleep. The categories available now are:

1. Nature: Nature and Chinese bamboo flute music
2. Classical: Vivaldi's Spring from Four Seasons
3. Ambience: Clear Night
4. Lullaby: Baa Baa Black Sheep


## Renaming File Procedure for App Submission

1. In the Project Navigator (left side of Xcode, click the Folder icon), select your project name (the blue file icon at the top).
2. Select your application under the Targets section.
3. Click on the Build Settings tab.
4. Search for "Product Name."
5. Double-click on the right column where it has the name of your target currently and then replace "$(TARGET_NAME)" with your full name.
6. Build to the device.