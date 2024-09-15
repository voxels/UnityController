import { requireNativeComponent, NativeModules } from 'react-native';
import React from 'react';
import { View, StyleSheet, Button, Alert } from 'react-native';

const { UnityViewManager } = NativeModules;

const MyApp = () => {
  // Function to handle button press
  const handleButtonPress = () => {
    UnityViewManager.sendTapEventToUnity()
  };

  return (
    <View style={styles.container}>
      <Button
        title="Launch Unity Game"
        onPress={handleButtonPress} // Action triggered on button press
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center', // Center the button vertically
    alignItems: 'center', // Center the button horizontally
    backgroundColor: 'lightgray', // Add background color to see if the view is rendering
  },
});

export default MyApp;