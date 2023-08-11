
window.initZoom =  function(sdkKey, sdkSecret, meetingNumber, userName, userRole, passWord) {
  const signature = generateSignature(sdkKey, sdkSecret, meetingNumber, userRole); // Calls the Dart function
  ZoomMtg.init({
    debug: true, //optional
    leaveUrl: 'https://rooftopapp.com', // Adjust as needed
    disablePreview: false,
    success: function () {
      try {
          ZoomMtg.join({
            debug: true,
            sdkKey: sdkKey,
            signature: signature,
            meetingNumber: meetingNumber,
            passWord: passWord,
            userName: userName,
            success: function(res) {
              console.log('Join meeting success');
            },
            error: function(res) {
              console.log(res);
            }
          });
      } catch(err) {
          console.log("Error: ", err.message);
      }
      console.log('Zoom initialization successful');
    },
    error: function (error) {
      console.error('Zoom initialization error', error);
    }
  });
};

window.joinMeeting = function(meetingNumber, passWord, userName, userEmail) {
  ZoomMtg.join({
    meetingNumber: meetingNumber,
    userName: userName,
    userEmail: userEmail, // Optional
    passWord: passWord,
    success: function () {
      console.log('Join meeting success');
    },
    error: function (error) {
      console.error('Join meeting error', error);
    }
  });
};

window.startMeeting = function(meetingNumber, passWord, userName, userEmail) {
  // You may need to create or schedule the meeting first
  // The code below assumes that the meeting has already been created

  ZoomMtg.join({
    meetingNumber: meetingNumber,
    userName: userName,
    userEmail: userEmail, // Optional
    passWord: passWord,
    success: function () {
      console.log('Start meeting success');
    },
    error: function (error) {
      console.error('Start meeting error', error);
    }
  });
};

