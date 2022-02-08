Benchee.run(
  %{
    "word_count_hamlet" => fn -> WordCount.run("hamlet_text.txt") end,
    "word_count_sample" => fn -> WordCount.run("bible.txt") end
  },
  memory_time: 1
)
