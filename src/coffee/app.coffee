import PasswordGenerator from './PasswordGenerator'

# Global Variables
lengthInput = document.getElementById 'length'
specialCharactersInput = document.getElementById 'special_characters'
generateButton = document.getElementById 'generate-button'
outputInput = document.getElementById 'generated_password'
copyLink = document.getElementById 'copy'

# Adding event listener to Generate button and
# generating the password
generateButton.addEventListener 'click', (e) ->
  e.preventDefault()
  # Stopping the process if value is invalid
  if (
    lengthInput.value < 2 or
    lengthInput.value > 100 or
    lengthInput.value == ''
  )
    return
  # Generating new password generator and passing values to it
  length = lengthInput.value
  wantSpecialChars = specialCharactersInput.checked
  generator = new PasswordGenerator length, wantSpecialChars
  # generating and adding value to output element
  outputInput.value = generator.generate()


# Selecting text when output Input is clicked
outputInput.addEventListener 'click', ->
  outputInput.select()
  outputInput.setSelectionRange 0, 9999

# Copying the password to the clickboard when copy link is clicked
copyLink.addEventListener 'click', (e) ->
  e.preventDefault()
  # Selecting text
  outputInput.select()
  outputInput.setSelectionRange 0, 9999
  # Copying to the clip board
  document.execCommand 'copy'
  # Showing alert for message
  alert 'Copied password to the clipboard!'