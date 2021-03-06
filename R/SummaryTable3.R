#' SummaryTable3
#' 
#' Table to display categorical summary information....
#' 
#' @usage
#'   SummaryTable1(data.df2)
#'
#' @param data.df2
#'   Define this parameter.
#'
#' @return
#'   What does this function return?
#' 
#' @import magrittr
#' 
#' @export
#'

SummaryTable3<-function(data.df2)  {
  SummaryTable_Categorical <- data.df2 %>% 
    dplyr::select_if(~!is.numeric(.) & length(unique(.)) < 50) %>%
    tidyr::gather(key="column_name", value='level') %>%
    dplyr::group_by(column_name, level) %>%
    tally %>%
    dplyr::ungroup() %>% group_by(column_name) %>%
    mutate(n_MainCategories = length(level),
           missingCount = ifelse(any(is.na(level)), n[is.na(level)], 0)
    )
  return(SummaryTable_Categorical)
}