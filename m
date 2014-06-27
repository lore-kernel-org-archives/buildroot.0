From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jun 2014 08:23:49 +0200
Subject: [Buildroot] [PATCH 1/1] opkg: bump to version 0.2.2 and update
 upstream url
In-Reply-To: <1403814629-4007-1-git-send-email-vsergeev@kumunetworks.com>
References: <1403814629-4007-1-git-send-email-vsergeev@kumunetworks.com>
Message-ID: <20140627082349.50341f05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ivan Sergeev,

On Thu, 26 Jun 2014 13:30:29 -0700, Ivan Sergeev wrote:

> -OPKG_VERSION = v0.2.0
> -OPKG_SOURCE = $(OPKG_VERSION).tar.bz2
> -OPKG_SITE = https://bitbucket.org/opkg/opkg/get
> +OPKG_VERSION = v0.2.2
> +OPKG_SITE = git://git.yoctoproject.org/opkg

Do they have http:// access? If so, we prefer to use it, as it's more
likely to work through company proxies.

Other than that, looks good!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
