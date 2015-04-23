From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 23 Apr 2015 23:16:49 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/tiff: Rework tiff utilities
	handling
References: <1429816903-2484-1-git-send-email-bernd.kuhls@t-online.de>
 <55396033.1000003@mind.be>
Message-ID: <XnsA485ECD1F6D76berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Arnout Vandecappelle <arnout@mind.be> wrote in 
news:55396033.1000003 at mind.be:

>  Okay, so here's the wild idea:
> 
> TIFF_SUBDIRS = port libtiff
> ifeq ($(BR2_PACKAGE_TIFF_UTILITIES),y)
> TIFF_SUBDIRS += tools
> endif
> 
> TIFF_MAKE = $(MAKE) SUBDIRS="$(TIFF_SUBDIRS)"
> 
>  Build test seems to work, I'll resubmit so tell me what you think.

Hi Arnout,

lgtm.

Regards, Bernd
