# gunter

Service for Updating Game Settings in Raycity RCRB

- Graphics Settings: Update graphics settings such as screen resolution, texture quality, 3D settings, etc.

- Sound Settings: Adjust sound settings including volume levels, sound types, and audio device settings.

- Inviting Friends: Update methods for inviting friends to play the game or manage invitations from friends.

Let me know if you need any more help!

# Build

add: SET_TARGET_PROPERTIES(${BINARY_NAME} PROPERTIES LINK_FLAGS    "/MANIFESTUAC:\"level='requireAdministrator' uiAccess='false'\" /SUBSYSTEM:WINDOWS")

to CMakeLists.txt