library(REDCapR)
uri<-"https://bbmc.ouhsc.edu/redcap/api/"
token<-"9A81268476645C4E5F03428B8AC3AA7B"
dummy_data<-redcap_read_oneshot(redcap_uri=uri, token=token)$data

#testing create_batch_glossary function

#breaks 5 rows into two batches of 2 and one of 1
create_batch_glossary(nrow(dummy_data), batch_size=2)

#creates one batch of 5, as we do not have enough rows to spill over to new batch
create_batch_glossary(nrow(dummy_data), batch_size=6)

#divides five rows into five batches of one row each.
# I would be verys surprised if this turned out to be helpful to anyone.
create_batch_glossary(nrow(dummy_data), batch_size=1)

#returns an error message.
create_batch_glossary(nrow(dummy_data), batch_size=0)
