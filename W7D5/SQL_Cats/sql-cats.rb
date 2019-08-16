require_relative './import_db.sql'

def example_select
  execute(<<-SQL)
    SELECT
      color
    FROM
      cats;
  SQL
end

