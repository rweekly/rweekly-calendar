create_curator_df <- function() {
  curator_df <- tibble::tribble(
    ~name, ~slack_id, ~calendar_color, ~name_color, ~email_address, ~picture,
    "Sam Parmar", "@parmsam", "#800080", "#ffffff", "parmartsam@gmail.com", "https://github.com/parmsam.png",
    "Batool Almarzouq", "@BatoolMM", "#f0e68c", "#000000", "batool@liverpool.ac.uk", "https://github.com/BatoolMM.png",
    "Ryo Nakagawara", "@Ryo-N7", "#4682b4", "#ffffff", "ryonakagawara@gmail.com", "https://github.com/Ryo-N7.png",
    "Jon Calder", "@jonmcalder", "#cd5c5c", "#ffffff", "jonmcalder@gmail.com", "https://github.com/jonmcalder.png",
    "Jonathan Kitt", "@Jonathan Kitt", "#adff2f", "#000000", "jonathan.kitt@proton.me", "https://github.com/KittJonathan.png",
    "Jonathan Carroll", "@jonocarroll", "#ffa500", "#000000","jono@jcarroll.com.au", "https://github.com/jonocarroll.png",
    "Eric Nantz", "@rpodcast", "#191970", "#ffffff", "theRcast@gmail.com", "https://github.com/rpodcast.png",
    "Colin Fay", "@ColinFay", "#ffff00", "#000000", "contact@colinfay.me", "https://github.com/ColinFay.png"
  )

  return(curator_df)
}