#Для работы используется гем Watir
#Веб-драйвер geckodriver
#Запускаем командой ruby loto.rb
require 'byebug'
require 'watir'

def exists(url)
	#chromedriver_path = File.join(File.absolute_path(File.dirname(__FILE__)),"chromedriver.exe")
	#Selenium::WebDriver::Chrome.driver_path = chromedriver_path
	# Открываем браузер
	browser = Watir::Browser.new :chrome
	 
	browser.window.maximize
	debugger
	# Переходим на сайт http://moikrug.ru           
	browser.goto 'http://old.toto-info.co/'
	browser
end



browser = exists('yandex.ru')