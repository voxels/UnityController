const {getDefaultConfig, mergeConfig} = require('@react-native/metro-config');
const blacklist = require('metro-config/src/defaults/exclusionList');
/**
 * Metro configuration
 * https://reactnative.dev/docs/metro
 *
 * @type {import('metro-config').MetroConfig}
 */
const config = {
	projectRoot: __dirname,
  resolver: {
    blacklistRE: blacklist([/node_modules\/.*\/node_modules\/react-native\/.*/]),
  },
  watchFolders: [
    // Include additional folders that you want Metro to watch
    './src',
  ]
};

module.exports = mergeConfig(getDefaultConfig(__dirname), config);
