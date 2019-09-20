class User < ApplicationRecord
    has_many :posts

    validates_presence_of :name
    before_create -> {self.token = generate_token}

    private

    def  generate_token 
        loop do
            token = SecureRandom.hex 
            return token unless User.exists?({token: token})
        end
    end
end
