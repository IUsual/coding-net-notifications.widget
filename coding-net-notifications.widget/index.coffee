# Your Coding.net sid here, which we used to pass 
# through account verification. You can get it on
# developer tools in chrome, or Developer in FireFox.
sid = "YOUR-SID"

# Window properties, that contains the width of window,
# and the right and top offset from the edge of desktop.
# Also your can edit `style` variable below if more
# deep customization is needed.
widget = 
	width: "300px"
	right: "10px"
	top: "10px"

# Data api of Coding.net
# Don't touch below this line unless you know what's going on
apis = 
	host: "https://coding.net"
	user: "/api/current_user"
	notifications: "/api/notification/unread-list"
	homePage: "/u/"

# An integer specifying how command is executed, or 
# in human language just like '2 days', '5s' and etc.
refreshFrequency: "1 min"

command: """
	echo "{"
	echo "\\\"user\\\": "
	curl -s #{apis.host}#{apis.user} --cookie sid=#{sid}
	echo ","

	echo "\\\"notifications\\\": "
	curl -s #{apis.host}#{apis.notifications} --cookie sid=#{sid}
	echo "}"
"""

apis: apis

render: (output) ->
	json = JSON.parse(output)
	result = 
		name: json.user.data.name
		global_key: json.user.data.global_key

	"""
	<div>
	    <section class="header section">
	    	<span class="name">#{result.name}</span>
	    	<span class="gk">
	    		(&nbsp;<a href="#{@apis.host}#{@apis.homePage}#{result.global_key}">#{result.global_key}</a>&nbsp;)
	    	</span>
	    </section>
	    <section class="notifications">
	    </section>
	</div>
	"""

renderNotificationItem: (item) ->
	date = new Date item.created_at
	time = (date.getMonth() + 1) + "-" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() 
	"""
		<div class="notification-item item">
			<p class="content">#{item.content}</p>
			<p class="time">#{time}</p>
		</div>
	"""

update: (output, domEle) -> 
	json = JSON.parse output

	notificationsArea = $ domEle
		.find ".notifications"
	notificationsArea.empty()

	notificationsArea.append @renderNotificationItem item for item in json.notifications.data.list
	

style: """
  font-family: Helvetica Neue
  font-size: 12px
  font-weight: 300
  line-height: 18px

  color: white
  background-color: rgba(0,0,0,0.6)

  right: #{widget.right}
  top: #{widget.top}

  width: #{widget.width}
  padding: 10px
  border-radius:4px

  word-break: break-all

  a[href]
  	color: white

  section:not(:last-child)
    padding-bottom: 5px
    border-bottom: 2px solid #ddd
    margin-bottom: 5px

  div.item
    padding: 1px 5px
    border-bottom: 1px solid rgba(61, 174, 125, 0.75)
    margin-bottom: 5px
    border-radius: 2px

    font-weight: 400
    font-size: 10px

    background-color: rgba(63, 191, 137, 0.75)

    .time
    	text-align: right

  .header
    .name
      font-size: 16px
	  font-weight: 500
	  text-transform: uppercase

"""