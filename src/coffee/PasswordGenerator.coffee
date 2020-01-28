###
# Represents the password generator
###
class PasswordGenerator
  # String for alpha numeric characters
  alphaNumericCharacters: 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
  # String for special characters
  specialCharacters: '!@#$%^&*()-+'
  # Generator's length
  length: 5
  # Generator's configuration for adding special characters
  addSpecialCharacters: false

  # Constructs the instant of the generator and sets values
  constructor: (len, wantSpecialCharacters) ->
    # setting default value 5 if value is invalid
    if len is undefined or len is null or len > 100 or len < 2
      @length = 5
    else
      @length = len
    # updating configuration for special characters
    @addSpecialCharacters = true if wantSpecialCharacters
  
  # Generates random integer number and return the value
  getRandomNumber: (max) ->
    Math.floor(Math.random() * Math.floor max)

  # Generates the password and return the value
  generate: ->
    # creating target string
    targetString = @alphaNumericCharacters
    # Adding spcial charactes if configuration is true
    if @addSpecialCharacters
      targetString = "#{targetString}#{@specialCharacters}"

    index = 0
    password = ''
    # Looping through string and adding random
    # chars to password
    while index < @length
      password += targetString.charAt @getRandomNumber(targetString.length)
      index++
    # Returning the password
    password

# Exporting the PasswordGenerator Class
export default PasswordGenerator