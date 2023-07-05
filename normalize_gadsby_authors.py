import re
import sys


def split_string(string):
    # Split the string on the '——' character
    substrings = string.split('——')

    # Strip whitespace from each substring
    return [substring.strip() for substring in substrings]


def to_title_case(string):
    # Split the string into words
    words = string.split()

    # Capitalize the first letter of each word
    title_case_words = [word.lower().capitalize() for word in words]

    # Join the words back together with spaces
    title_case_string = " ".join(title_case_words)

    return title_case_string


def is_easy_author_to_repair(author):
    matcher = "^([a-z]\. )+[a-z]{3,}$"
    regex = re.compile(matcher, re.IGNORECASE)
    return re.match(regex, author)

def normalize_name(name):
    # Split the name into parts
    parts = name.split(' ')
    last_name = parts[-1]
    first_initials = [part[0] for part in parts[:-1]]
    return last_name + ', ' + ' '.join(first_initials)


# Read in from stdin

for line in sys.stdin:
    # Split the line into substrings
    page, meter, name = split_string(line.strip())
    # Loop over the substrings
    # Check if the substring is an easy author to repair
    if is_easy_author_to_repair(name):
        # Normalize the name
        normalized_name = normalize_name(to_title_case(name))
        # Print the normalized name
        output = [normalized_name, page, meter, name, 'true']
    else:
        normalized_name = to_title_case(name)
        output = [normalized_name, page, meter, name, 'false']
    # Print a newline
    print('\t'.join(output))
