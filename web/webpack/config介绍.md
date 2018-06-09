##Entry
##Output
##Loaders (Modules)
Loader用于将非js文件转换为可以被js代码import的模块。至于文件实际是以怎样的形式被纳入项目中，取决于loader的实现。

1. The test property identifies which file or files should be transformed.
2. The use property indicates which loader should be used to do the transforming.

##Plugins
##Mode
##范例
```
module.exports = {
  entry: './src/index.js',

  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist')
  }

  modules: {
    rules: [
      { test: /\.txt$/, use: 'raw-loader' }
	  { test: /\.(png|svg|jpg|gif)$/, use: 'file-loader'] }
	  { test: /\.css$/, use: ['style-loader', 'css-loader'] }
	  { test: /\.jsx$/, use: 'babel-loader' }
    ]
  }

  mode: 'production'
};
```