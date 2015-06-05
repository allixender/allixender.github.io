---
layout: archive
permalink: /articles/
title: "Posts"
---

<div class="tiles">
{% for post in site.posts %}
	{% include post-list.html %}
{% endfor %}
</div><!-- /.tiles -->