#' @title function to make barcode labels and produce a pdf
#' @description this function makes barcodes from a column with unique IDs in a dataframe and creates a PDF. The type of labels used is: Avery 4778 and can be ordered here: https://www.lyreco.com/webshop/NONO/etiketter-avery-45-7-x-21-2-mm-hvit-eske-c3a0-960-stk-product-000000000002760191.html
#' @param uniqueID tibble with IDs to make the barcode with column header called hashcode
#' @param name name of output file
#' @details the uniqueID dataframe can be created using this code \code{unique_PFTC_envelope_codes}
#' @return PDF with barcodes from IDs
#' @examples
#' make_barcode_labels(uniqueID = myIDs, name = "my_labels_PFTC6")
#' @importFrom baRcodeR custom_create_PDF
#' @export


make_barcode_labels <- function(uniqueID, name){

  custom_create_PDF(Labels = uniqueID$hashcode,
                    name = name,
                    type = "linear",
                    Fsz = 14,
                    Across = TRUE,
                    trunc = TRUE,
                    numrow = 12,
                    numcol = 4,
                    page_width = 8.3,
                    page_height = 11.7,
                    width_margin = 0.2,
                    height_margin = 0.7,
                    label_width = 1.811,
                    label_height = 0.5)

}
