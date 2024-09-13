/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import { requireNativeComponent } from 'react-native';
import React from 'react';
import { View } from 'react-native';

const UnityView = requireNativeComponent('UnityView');

const MyApp = () => {
  return (
    <View style={{ flex: 1 }}>
      <UnityView style={{ flex: 1 }} />
    </View>
  );
};

export default MyApp;
