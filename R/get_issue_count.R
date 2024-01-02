get_issue_count <- function() {
  rweekly_issue_list <- gh("GET /repos/rweekly/rweekly.org/contents/_posts")
  
  n_issues <- length(rweekly_issue_list)
  return(n_issues)
}