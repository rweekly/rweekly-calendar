create_curator_df <- function() {
  curator_df <- tibble::tribble(
    ~name, ~slack_id, ~calendar_color, ~email_address, ~picture,
    "Sam Parmar", "@parmsam", "purple", "parmartsam@gmail.com", "https://github.com/parmsam.png",
    "Batool Almarzouq", "@BatoolMM", "khaki", "batool@liverpool.ac.uk", "https://github.com/BatoolMM.png",
    "Ryo Nakagawara", "@Ryo-N7", "steelblue", "ryonakagawara@gmail.com", "https://github.com/Ryo-N7.png",
    "Jon Calder", "@jonmcalder", "indianred", "jonmcalder@gmail.com", "https://github.com/jonmcalder.png",
    "Tony ElHabr", "@tonyelhabr", "greenyellow", "anthonyelhabr@gmail.com", "https://github.com/tonyelhabr.png",
    "Jonathan Carroll", "@jonocarroll", "orange", "jono@jcarroll.com.au", "https://github.com/jonocarroll.png",
    "Eric Nantz", "@rpodcast", "midnightblue", "theRcast@gmail.com", "https://github.com/rpodcast.png",
    "Colin Fay", "@ColinFay", "yellow", "contact@colinfay.me", "https://github.com/ColinFay.png"
  )

  return(curator_df)
}