From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Apr 2011 11:30:15 -0300
Subject: [Buildroot] [PATCH v3] libnl: bump to version 3.0
In-Reply-To: <4DB97757.3090305@visionsystems.de>
References: <4DB8134E.1030503@visionsystems.de>	<4DB91798.6050601@visionsystems.de>	<20110428140919.77d3027f@surf>
	<4DB97757.3090305@visionsystems.de>
Message-ID: <4DB979F7.6070707@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/28/11 11:19, Yegor Yefremov wrote:

> but if I run make again everything gets built like a charm. Perhaps this is caused by -j16. So no need for big hammer :-)
> 
> Best regards,
> Yegor

Define LIBNL_MAKE = $(MAKE1) in libnl.mk and try to reproduce it again.
It's not ideal and the libnl Makefile should be fixed upstream though.
Regards.
