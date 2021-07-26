library(TSS.RESTREND)
library(raster)
library(ggplot2)
library(rgdal)
library(ggthemes)
library(graphics)

yearly_ndvi <- list.files('/media/shirish/New Volume/GIIS/Training Session/R/Ashweshwar Ji (GEEOUT)/Data/1 year data (NDVI and Climate)/NDVI',
                          full.names = TRUE,
                          pattern = ".tif$")

yearly_climate <- list.files('/media/shirish/New Volume/GIIS/Training Session/R/Ashweshwar Ji (GEEOUT)/Data/1 year data (NDVI and Climate)/Tera Climate',
                             full.names = TRUE,
                             pattern = ".tif$")

yearly_ndvi_stack <- stack(yearly_ndvi)
yearly_climate_stack <- stack(yearly_climate)

yearly_ndvi_stack_df <- as.data.frame(yearly_ndvi_stack, xy=T)
yearly_climate_stack_df <- as.data.frame(yearly_climate_stack, xy=T)

yearly_ndvi_stack_df <- na.omit(yearly_ndvi_stack_df)
yearly_climate_stack_df <- na.omit(yearly_climate_stack_df)

CTSR.VI <- yearly_ndvi_stack_df
rf.data <- yearly_climate_stack_df

max.acp <- 12
max.osp <- 4

ACP.table <- climate.accumulator(CTSR.VI, rf.data, max.acp, max.osp)


# ggplot() + 
#     geom_raster(data = CTSR.VI, aes(x=x, y=y, fill = X200101)) + 
#     theme_bw() +
#     coord_quickmap()

# class(CTSR.VI)
# typeof(CTSR.VI)
# summary(CTSR.VI)
# mean_CTSR.VI <- c(0.3077, 0.2998, 0.2736, 0.2827, 0.33383, 0.3913, 0.3179, 0.3685, 0.4587, 0.4445, 0.4035, 0.3647)
# max_CTSR.VI <- c(0.9701, 0.9608, 0.9892, 0.8743, 0.98430, 0.9837, 0.9793, 0.9806, 0.9741, 0.9954, 0.9302, 0.8953)
# typeof(mean_CTSR.VI)
# CTSR.VI.timeseries <- ts(mean_CTSR.VI ,start = c(2012,1),frequency = 12)
# print(CTSR.VI.timeseries)
# plot(CTSR.VI.timeseries)

#mean_rf.data <- c(34.82, 44.68, 40.45, 118.2, 239.4, 220.8, 263.8, 225.5, 176.9, 101.7, 39.2,  22.12)
#rf.data.timeseries <- ts(mean_rf.data ,start = c(2001,1),frequency = 12)
#plot(rf.data.timeseries)
