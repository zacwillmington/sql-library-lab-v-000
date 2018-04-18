def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year
    FROM books
    WHERE books.series_id = 1
    ORDER BY books.year ASC;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name, characters.motto
    FROM characters
    ORDER BY length (characters.motto) DESC LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT characters.species, COUNT(characters.species) AS species_count
  FROM characters
  GROUP BY characters.species
  ORDER BY species_count DESC LIMIT 1; "
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
FROM series
LEFT JOIN authors, subgenres
ON series.author_id = authors.id AND series.subgenre_id = subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title
FROM characters
inner join series
ON characters.series_id = series.id
WHERE characters.species = 'human'
group by series.title
ORDER BY sum(characters.species = 'human') DESC LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
    "SELECT characters.name , COUNT(character_books.book_id)
    FROM characters
   inner JOIN character_books
    ON characters.id = character_books.character_id
    GROUP BY characters.name
    ORDER BY COUNT(character_books.book_id)  DESC, characters.name ASC
   ;"
end
