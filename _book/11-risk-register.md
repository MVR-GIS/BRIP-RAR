# Risk Register


```r
library(timevis)
#> Warning: package 'timevis' was built under R version 4.1.1
library(tidyverse)
#> Warning: package 'tidyverse' was built under R version 4.1.1
#> -- Attaching packages ------------------- tidyverse 1.3.1 --
#> v ggplot2 3.3.5     v purrr   0.3.4
#> v tibble  3.1.4     v dplyr   1.0.7
#> v tidyr   1.1.3     v stringr 1.4.0
#> v readr   2.0.1     v forcats 0.5.1
#> Warning: package 'ggplot2' was built under R version 4.1.1
#> Warning: package 'tibble' was built under R version 4.1.1
#> Warning: package 'tidyr' was built under R version 4.1.1
#> Warning: package 'readr' was built under R version 4.1.1
#> Warning: package 'purrr' was built under R version 4.1.1
#> Warning: package 'dplyr' was built under R version 4.1.1
#> Warning: package 'stringr' was built under R version 4.1.1
#> Warning: package 'forcats' was built under R version 4.1.1
#> -- Conflicts ---------------------- tidyverse_conflicts() --
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
```


## `timevis` Timelines


```r
timevisData <- data.frame(
  id = 1:11,
  content = c("Open", "Open",
              "Open", "Open", "Half price entry",
              "Staff meeting", "Open", "Adults only", "Open", "Hot tub closes",
              "Siesta"),
  title = c(""),
  start = c("2016-05-01 07:30:00", "2016-05-01 14:00:00",
            "2016-05-01 06:00:00", "2016-05-01 14:00:00", "2016-05-01 08:00:00",
            "2016-05-01 08:00:00", "2016-05-01 08:30:00", "2016-05-01 14:00:00",
            "2016-05-01 16:00:00", "2016-05-01 19:30:00",
            "2016-05-01 12:00:00"),
  end   = c("2016-05-01 12:00:00", "2016-05-01 20:00:00",
            "2016-05-01 12:00:00", "2016-05-01 22:00:00", "2016-05-01 10:00:00",
            "2016-05-01 08:30:00", "2016-05-01 12:00:00", "2016-05-01 16:00:00",
            "2016-05-01 20:00:00", NA,
            "2016-05-01 14:00:00"),
  group = c(rep("lib", 2), rep("gym", 3), rep("pool", 5), NA),
  type = c(rep("range", 9), "point", "background")
)
timevisDataGroups <- data.frame(
  id = c("lib", "gym", "pool"),
  content = c("Library", "Gym", "Pool")
)
```



```r
timevis::timevis(data = timevisData,
                 groups = timevisDataGroups) %>%
  timevis::centerItem(itemId = 8) %>%
  timevis::setWindow(start = "2016-05-01 01:00:00", 
                      end = "2016-05-01 23:00:00
")
```

```{=html}
<div id="htmlwidget-b3e0cb740bb1691476fe" class="timevis html-widget" style="width:672px;height:480px;">
<div class="btn-group zoom-menu">
<button type="button" class="btn btn-default btn-lg zoom-in" title="Zoom in">+</button>
<button type="button" class="btn btn-default btn-lg zoom-out" title="Zoom out">-</button>
</div>
</div>
<script type="application/json" data-for="htmlwidget-b3e0cb740bb1691476fe">{"x":{"items":[{"id":"1","content":"Open","title":"","start":"2016-05-01 07:30:00","end":"2016-05-01 12:00:00","group":"lib","type":"range"},{"id":"2","content":"Open","title":"","start":"2016-05-01 14:00:00","end":"2016-05-01 20:00:00","group":"lib","type":"range"},{"id":"3","content":"Open","title":"","start":"2016-05-01 06:00:00","end":"2016-05-01 12:00:00","group":"gym","type":"range"},{"id":"4","content":"Open","title":"","start":"2016-05-01 14:00:00","end":"2016-05-01 22:00:00","group":"gym","type":"range"},{"id":"5","content":"Half price entry","title":"","start":"2016-05-01 08:00:00","end":"2016-05-01 10:00:00","group":"gym","type":"range"},{"id":"6","content":"Staff meeting","title":"","start":"2016-05-01 08:00:00","end":"2016-05-01 08:30:00","group":"pool","type":"range"},{"id":"7","content":"Open","title":"","start":"2016-05-01 08:30:00","end":"2016-05-01 12:00:00","group":"pool","type":"range"},{"id":"8","content":"Adults only","title":"","start":"2016-05-01 14:00:00","end":"2016-05-01 16:00:00","group":"pool","type":"range"},{"id":"9","content":"Open","title":"","start":"2016-05-01 16:00:00","end":"2016-05-01 20:00:00","group":"pool","type":"range"},{"id":"10","content":"Hot tub closes","title":"","start":"2016-05-01 19:30:00","group":"pool","type":"point"},{"id":"11","content":"Siesta","title":"","start":"2016-05-01 12:00:00","end":"2016-05-01 14:00:00","type":"background"}],"groups":[{"id":"lib","content":"Library"},{"id":"gym","content":"Gym"},{"id":"pool","content":"Pool"}],"showZoom":true,"zoomFactor":0.5,"fit":true,"options":[],"height":null,"timezone":null,"api":[{"method":"centerItem","itemId":8},{"method":"setWindow","start":"2016-05-01 01:00:00","end":"2016-05-01 23:00:00\n"}]},"evals":[],"jsHooks":[]}</script>
```

