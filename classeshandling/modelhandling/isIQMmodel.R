isIQMmodel <- function( model ) {
   ## % isIQMmodel: check if input argument is an IQMmodel.
   ## % <<<COPYRIGHTSTATEMENT - IQM TOOLS LITE>>>
   ## output = strcmp(class(model),'IQMmodel');
   ## print( any( class( model ) %in% c( "IQMmodel" ) ) )
   output = any( class( model ) %in% c( "IQMmodel" ) )
}