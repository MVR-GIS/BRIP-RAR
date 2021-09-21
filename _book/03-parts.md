# Parts

You can add parts to organize one or more book chapters together. Parts can be inserted at the top of an .Rmd file, before the first-level chapter heading in that same file. 

Add a numbered part: `# (PART) Act one {-}` (followed by `# A chapter`)

Add an unnumbered part: `# (PART\*) Act one {-}` (followed by `# A chapter`)

Add an appendix as a special kind of un-numbered part: `# (APPENDIX) Other stuff {-}` (followed by `# A chapter`). Chapters in an appendix are prepended with letters instead of numbers.

## `timevis` Timelines


```r
timevisData <- data.frame(
  id = 1:11,
  content = c("Open", "Open",
              "Open", "Open", "Half price entry",
              "Staff meeting", "Open", "Adults only", "Open", "Hot tub closes",
              "Siesta"),
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
timevis::timevis(data = timevisData)
```

```{=html}
<div id="htmlwidget-417695ba33bab2aaafa7" class="timevis html-widget" style="width:672px;height:480px;">
<div class="btn-group zoom-menu">
<button type="button" class="btn btn-default btn-lg zoom-in" title="Zoom in">+</button>
<button type="button" class="btn btn-default btn-lg zoom-out" title="Zoom out">-</button>
</div>
</div>
<script type="application/json" data-for="htmlwidget-417695ba33bab2aaafa7">{"x":{"items":[{"id":"1","content":"Open","start":"2016-05-01 07:30:00","end":"2016-05-01 12:00:00","group":"lib","type":"range"},{"id":"2","content":"Open","start":"2016-05-01 14:00:00","end":"2016-05-01 20:00:00","group":"lib","type":"range"},{"id":"3","content":"Open","start":"2016-05-01 06:00:00","end":"2016-05-01 12:00:00","group":"gym","type":"range"},{"id":"4","content":"Open","start":"2016-05-01 14:00:00","end":"2016-05-01 22:00:00","group":"gym","type":"range"},{"id":"5","content":"Half price entry","start":"2016-05-01 08:00:00","end":"2016-05-01 10:00:00","group":"gym","type":"range"},{"id":"6","content":"Staff meeting","start":"2016-05-01 08:00:00","end":"2016-05-01 08:30:00","group":"pool","type":"range"},{"id":"7","content":"Open","start":"2016-05-01 08:30:00","end":"2016-05-01 12:00:00","group":"pool","type":"range"},{"id":"8","content":"Adults only","start":"2016-05-01 14:00:00","end":"2016-05-01 16:00:00","group":"pool","type":"range"},{"id":"9","content":"Open","start":"2016-05-01 16:00:00","end":"2016-05-01 20:00:00","group":"pool","type":"range"},{"id":"10","content":"Hot tub closes","start":"2016-05-01 19:30:00","group":"pool","type":"point"},{"id":"11","content":"Siesta","start":"2016-05-01 12:00:00","end":"2016-05-01 14:00:00","type":"background"}],"groups":null,"showZoom":true,"zoomFactor":0.5,"fit":true,"options":[],"height":null,"timezone":null,"api":[]},"evals":[],"jsHooks":[]}</script>
```

