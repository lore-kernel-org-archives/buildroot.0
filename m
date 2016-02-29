From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:52:24 +0100
Subject: [Buildroot] [PATCH 08/32] package/systemd: remove networkd
 depends from timesyncd
In-Reply-To: <56CF97D8.7000603@mind.be>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
 <1456437341-19025-9-git-send-email-gabe@hashrabbit.co>
 <56CF97D8.7000603@mind.be>
Message-ID: <20160229225224.219c79f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Fri, 26 Feb 2016 01:10:00 +0100, Arnout Vandecappelle wrote:

> >  config BR2_PACKAGE_SYSTEMD_TIMESYNCD
> >  	bool "enable SNTP client"
> 
>  SNTP?

https://tools.ietf.org/html/rfc4330

> > -	depends on BR2_PACKAGE_SYSTEMD_NETWORKD
> >  	help
> >  	  systemd-timesyncd is a service that may be used to synchronize the
> >  	  local system clock with a Network Time Protocol Server.
> 
>  Server -> server?

Fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
