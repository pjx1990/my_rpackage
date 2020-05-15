#' Use r code to connect uniprot web api
#'
#' You can choose one id as well as another id as output id
#' Know more information you can learn from uniprot documentation
#'
#' @param query vector of protein ids
#' @param inputid type of input id, character
#' @param outputid type of output id, character
#' @param fmt output format
#'
#' @return a dataframe
#' @export
#'
#' @examples
#' result <- idmapping(query=proid, inputid="ACC", outputid="P_ENTREZGENEID", fmt="fmt")
#'
idmapping <- function(query, inputid, outputid, fmt){
  query <- paste(qurey,collapse = ",")
  r <- httr::POST('http://www.uniprot.org/uploadlists/',
                  body = list(from=inputid, to=outputid, format=fmt,query=query),encode = "form")
  cont <- httr::content(r, type = "text")
  result <- readr::read_tsv(cont)
}




