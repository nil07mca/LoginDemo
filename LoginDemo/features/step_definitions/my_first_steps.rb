Given /^I am on the Welcome Screen$/ do
  element_exists("view")
  sleep(STEP_PAUSE)
end

Given /^I am on the Home Screen$/ do
    touch("button index:0")
    sleep(STEP_PAUSE)
end

And /^I touch the Login button$/ do
    touch("button index:0")
    sleep(STEP_PAUSE)
end

Given /^I am on the Login Screen$/ do
    touch("button index:0")
    sleep(STEP_PAUSE)
end


Given /^I am on the Home Screen to test wrong credential$/ do
    touch("button index:0")
    sleep(STEP_PAUSE)
    touch("textField marked:'Username'")
    wait_for_keyboard()
    keyboard_enter_text 'Hello'
    query "textField isFirstResponder:1", :resignFirstResponder
    touch("textField marked:'Password'")
    wait_for_keyboard()
    keyboard_enter_text 'World'
    query "textField isFirstResponder:1", :resignFirstResponder
    
    sleep(STEP_PAUSE)
    touch("button index:0")
    sleep(STEP_PAUSE)
end


Given /^I am on the Home Screen to test correct credential$/ do
    touch("button index:0")
    sleep(STEP_PAUSE)
    touch("textField marked:'Username'")
    wait_for_keyboard()
    keyboard_enter_text 'Jane Doe'
    query "textField isFirstResponder:1", :resignFirstResponder
    touch("textField marked:'Password'")
    wait_for_keyboard()
    keyboard_enter_text '123'
    query "textField isFirstResponder:1", :resignFirstResponder
    
    sleep(STEP_PAUSE)
    touch("button index:0")
    sleep(STEP_PAUSE)
end

Given /^I am on the Details Screen to test logout$/ do
    touch("button index:0")
    sleep(STEP_PAUSE)
end

Given /^I am on the Login Screen press back button$/ do
    touch("button index:0")
    sleep(STEP_PAUSE)
    touch("navigationItemButtonView first")
    sleep(STEP_PAUSE)
end


