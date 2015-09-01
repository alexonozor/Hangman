require 'spec_helper'

describe Model do
  let(:model_class){ Model.new }
  it 'generates word greater than 5 and less than 12' do
    value = model_class.generated_word
    expect(value.length).to be >=(5)
    expect(value.length).to be <=(12)
  end

  it 'it removes chances' do
    expect(model_class.chances).to be 7
    model_class.remove_chance
    expect(model_class.chances).to be < 7
  end


  it 'returns true when input is in secret word' do
    secret = model_class.secret.split('')
    secret_input = secret.sample
    not_included_string = ('a'..'z').to_a - secret
    expect(model_class.secret_match? secret_input).to be true
    expect(model_class.secret_match? not_included_string.sample).to be false
  end

  it 'can load game data' do
    correct_secret = model_class.load_game
    expect(correct_secret.length).to be >=(5)
    expect(correct_secret.length).to be <=(12)
  end
end

# describe Guide do
#   let(:guide_class){ Guide.new }
#   it 'generates word greater than 5 and less than 12' do
#     value = model_class.generated_word
#     expect(value.length).to be >=(5)
#     expect(value.length).to be <=(12)
#   end
# 
#   it 'it removes chances' do
#     expect(model_class.chances).to be 7
#     model_class.remove_chance
#     expect(model_class.chances).to be < 7
#   end
# 
# 
#   it 'returns true when input is in secret word' do
#     secret = model_class.secret.split('')
#     secret_input = secret.sample
#     not_included_string = ('a'..'z').to_a - secret
#     expect(model_class.secret_match? secret_input).to be true
#     expect(model_class.secret_match? not_included_string.sample).to be false
#   end
# 
#   it 'can load game data' do
#     correct_secret = model_class.load_game
#     expect(correct_secret.length).to be >=(5)
#     expect(correct_secret.length).to be <=(12)
#   end
# end
