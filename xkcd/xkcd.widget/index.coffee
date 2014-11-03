
command: "curl --silent http://xkcd.com/info.0.json"

# Set the refresh frequency (milliseconds) to every 6 hours
refreshFrequency: 21600000

# Render the output.
render: (output) -> """
  <div id='container'>
  <div>
"""
update: (output, domEl) -> 
  xkcd = JSON.parse(output)
  container = $(domEl).find('#container')
  content = 
    """
	<div style="text-align:center">
    <h2>#{xkcd.title}</h2>
    <img src="#{xkcd.img}"/>
    <div class='alt'>#{xkcd.alt}</div>
	</div>
    """
  $(container).html content

# CSS Style
style: """
  padding:10px
  right:20px
  bottom: 120px
  color: #fff
  font-family: Helvetica Neue
  font-size: 8px
  font-weight: 500
  background: rgba(#000, .3)
  border-radius:10px
  height: auto
  width: auto
  
	
  h2
    text-align:center
  .alt
    text-align:center
    margin:12px
  img
    margin:12px
	  display: inline-block
	  width: auto !important
	  height: 100% !important
	  margin-left:50%
	  margin-right:auto
	  max-width:660px
"""
