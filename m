From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Tue, 20 Oct 2009 00:18:16 +0200
Subject: [Buildroot] [PATCH 2/2] gst-plugins-good: make new
	dependency-less plugins configurable
In-Reply-To: <1255988782-4840-1-git-send-email-s.neumann@raumfeld.com>
References: <1255988782-4840-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <200910200018.17071.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sven Neumann, 19.10.2009:
> +config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_Y4M
> +	bool "y4m"
> +

> +ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_Y4m),y)

Typo: must be an uppercase M in Y4m.
