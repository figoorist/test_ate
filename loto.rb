#Для работы используется гем Watir
#Веб-драйвер chromedriver
#Запускаем командой ruby loto.rb
require 'byebug'
require 'watir'

def set_up
	#chromedriver_path = File.join(File.absolute_path(File.dirname(__FILE__)),"chromedriver.exe")
	#Selenium::WebDriver::Chrome.driver_path = chromedriver_path
	# Открываем браузер
	browser = Watir::Browser.new :chrome
	 
	browser.window.maximize
	
	# Переходим на сайт http://moikrug.ru           
	browser.goto 'http://old.toto-info.co/'
	browser
end

def open_tickets_window(browser)

	browser.element(:xpath => "//*[contains(@class, 'x-grid3-row-first')]").wait_until(&:present?).element(:xpath => "//*[contains(@class, 'x-grid3-col-Id')]").wait_until(&:present?).link.wait_until(&:present?).click

	browser.div(:id => "results").wait_until(&:present?).button(:text => "tickets").wait_until(&:present?).click

	browser.browser.div(visible_text: /Tickets distribution by amounts/, id: "ext-comp-1030").wait_until(&:present?)

	browser.browser.div(visible_text: /Tickets distribution by amounts/, id: "ext-comp-1030").divs(class: "x-grid3-row").first.wait_until(&:present?).link.click

	browser.browser.div(id: "ext-comp-1046").wait_until(&:present?)
end

def get_tickets(browser)
	file = File.open('tickets.txt', 'w')

	previous_first_ticket_code = 0
	next_first_ticket_code = browser.div(id: "ext-comp-1046").wait_until(&:present?).divs(class: "x-grid3-row").first.td(class: "x-grid3-cell-first").text.to_i
	
	while previous_first_ticket_code != next_first_ticket_code do

	  file.puts browser.div(id: "ext-comp-1046").wait_until(&:present?).divs(class: "x-grid3-row").map{|i| i.td(class: "x-grid3-cell-last").text }

	  browser.div(id: "ext-comp-1046").wait_until(&:present?).button(class: "x-tbar-page-next").click

	  Watir::Wait.until { next_first_ticket_code != browser.div(id: "ext-comp-1046").wait_until(&:present?).divs(class: "x-grid3-row").first.td(class: "x-grid3-cell-first").text.to_i }

	  previous_first_ticket_code = next_first_ticket_code
	  next_first_ticket_code = browser.div(id: "ext-comp-1046").wait_until(&:present?).divs(class: "x-grid3-row").first.td(class: "x-grid3-cell-first").text.to_i
	end

	file.close
end

browser = set_up

open_tickets_window(browser)

get_tickets(browser)
