import re
import string

printable = set(string.printable)

with open("/home/cole/thesis.bib", 'r') as bib:
    b = bib.read()

# make a nice list of AuthorYear to use to cite sources from
author_year_list = []
for line in b.split('\n'):
    l = {}
    # split the line starting at the first instance of { - so after @(citation source) and until the final }
    line = line[line.find('{')+1:-2]
    val = line.split(",")
    # for every single line with a variable (eg comma at end) in the raw line
    for v in val:
        # if it's actually a variable
        if "=" in v:
            # make a list of [variable, value]
            name_val = v.strip().split("=")
            # remove any character that LaTeX has issues parsing from the value
            val = ''.join(filter(lambda c: c in printable, name_val[1]))
            # set the variable to equal the value in the dictionary
            l[name_val[0].strip()] = re.sub('[{}]', '', val)
    # if there's an author, add a string to the list in the format AuthorYear
    if l.get('author') is not None:
        ay = l.get("author") + l.get("year")
        author_year_list.append(ay)

# push all these new values of AuthorYear in to a new bibliography file to parse in an easy way
with open("/home/cole/thesiscopy.bib", "w") as bib:
    count = len(b.split('\n'))
    for line in b.split('\n'):
        if line is not "":
            # regex magic
            newl = re.sub("{ a", "{" + author_year_list.pop(0) + ",\n\t a", line, count = 1) + "\n\n"
            newl = re.sub("},", "},\n\t", newl)
            newl = re.sub("\t.*url=.*,\n", '', newl)
            bib.write(newl)
