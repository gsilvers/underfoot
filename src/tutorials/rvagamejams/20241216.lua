coins = {
  ["half"] = "50 cents",
  ["quarter"] = "25 cents",
  ["dime"] = "10 cents",
  ["nickel"] = "5 cents",
  ["penny"] = "1 cent"
}

print("Which coin do you have?")
response = io.read()

print("Your coin is worth " .. coins[response] .. ".")
