import re
with open("/home/cole/thesis.bib", 'r') as bib:
    b = bib.read()

# all this does is make a list of strings.
# those strings are in the format AuthorYear, and are used in latex citation (\autocite{AuthorYear})
author_year_list = []
for line in b.split('\n'):
    l = {}
    line = line[line.find('{')+1:-2]
    val = line.split(",")
    for v in val:
        if "=" in v:
            # add each entry to dict, similar to parsing json but not quite close enough 
            name_val = v.strip().split("=")
            l[name_val[0].strip()] = re.sub('[{}]', '', name_val[1])
    # if there's an author, get the first name that appears (a last name) and the year (20xx) and add together to list
    if l.get('author') is not None:
        ay = l.get("author") + l.get("year")
        author_year_list.append(ay)

# this is used to write a nicer, formatted version of thesis.bib
# also the AuthorYear is added to this new copy for citation
with open("/home/cole/thesiscopy.bib", "w") as bib:
    count = len(b.split('\n'))
    print(f"count: {count}")
    for line in b.split('\n'):
        if line is not "":
            # insert the AuthorYear for this entry right before the author list
            newl = re.sub("{ a", "{" + author_year_list.pop(0) + ",\n\t a", line, count = 1) + "\n\n"
            # after each list is finished, write a newline and tab to format
            newl = re.sub("},", "},\n\t", newl)
            # don't include the url. in my case citations were from scopus.com and the url was just their site
            newl = re.sub("\n.*url=.*\n", "\n", newl)
            bib.write(newl)
