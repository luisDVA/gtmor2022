dat <-
tibble::tribble(
  ~year, ~value1, ~value2,
  1999L,      NA,      NA,
  2000L,      NA,      NA,
  2001L,      NA,      NA,
  2002L,      NA,      NA,
  2003L,      NA,     23L,
  2004L,      NA,     43L,
  2005L,     12L,      NA,
  2006L,      3L,      4L,
  2007L,      5L,      3L,
  2008L,      6L,      3L,
  2009L,      7L,      NA,
  2010L,      NA,      4L
  )

# position
which(!is.na(dat$value1))[1]
# value
first(na.omit(dat$value1))
