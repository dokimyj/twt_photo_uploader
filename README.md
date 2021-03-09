# Twitter Periodic Photo Uploader
let me check how to use GHA...

# Structure
1. Twitter Login Module
2. Photo Picker Module
3. Tweeting Module

# Discussion
1. Optimal method to pick the photo from library
2. Where to save the photos
3. Does secured login screen pop up when logging in from docker?

# Frequency
- As I use Free Plan for Github Actions, the limitation would be resolved to the plan.
- Free Plan = 2000 Minutes/mth, 500MB of action space
- Photos are almost 450MB now, pretty sure no more photos will be uploaded.
- 24*2*30 = 1440, 2000/1440 = 1.3888888... -> Goal = Set everything up in 30s, every ~15 mins.~ 1hrs. 
  - Twitter lowered limit pretty far down(10~20 twts/min I think...)
