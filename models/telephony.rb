class Telephony

    # create a class constant which is a hash
    # mapping integers to an array of their associated alpha characters
    ALPHA_CHARACTER_MAPPING_ARRAY = {
        0 => [],
        1 => [],
        2 => ['A', 'B', 'C'],
        3 => ['D', 'E', 'F'],
        4 => ['G', 'H', 'I'],
        5 => ['J', 'K', 'L'],
        6 => ['M', 'N', 'O'],
        7 => ['P', 'Q', 'R', 'S'],
        8 => ['T', 'U', 'V'],
        9 => ['W', 'X', 'Y', 'Z']
    }

    class << self
        def permutations(integer_array)
            integer_array.delete(0)
            integer_array.delete(1)
            return generator(alpha_character_mapping(integer_array), integer_array.length, [], 0, '')
        end

        def alpha_character_mapping(integer_array)
            alpha_charater_array = []
            integer_array.each do |integer|
                alpha_charater_array.push(self::ALPHA_CHARACTER_MAPPING_ARRAY[integer])
            end
            return alpha_charater_array
        end

        def generator(alpha_characters, max, word_array, cycleCount, current)
            if cycleCount == max
                word_array.push(current)
            else
                generate_word(alpha_characters, max, word_array, cycleCount, current)
            end
            return word_array
        end

        def generate_word(alpha_characters, max, word_array, cycleCount, current)
            i = 0
            while i < alpha_characters[cycleCount].length
                adjacent = current + alpha_characters[cycleCount][i]
                generator(alpha_characters, max, word_array, cycleCount + 1, adjacent)
                i += 1
            end
        end
    end
end