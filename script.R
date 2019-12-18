# Select dataset

dataset = read.csv('FRvideos.csv')

# Information

#View(dataset)
#str(dataset)
#ummary(dataset)

# Add column

dataset$trending_date = as.Date(dataset$trending_date, format = '%y.%d.%m')
dataset$publish_time = as.Date(dataset$publish_time, format = '%Y-%m-%d')

dataset = transform(dataset, time_before_trending = trending_date - publish_time)

View(dataset)
