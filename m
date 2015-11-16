From: Alex Suykov <alex.suykov@gmail.com>
Date: Mon, 16 Nov 2015 23:52:44 +0200
Subject: [Buildroot] [PATCH 1/2] vboot-utils: new package
In-Reply-To: <564A3A5F.3010301@mind.be>
References: <cover.1447689401.git.alex.suykov@gmail.com>
 <39f87349d2f42ac5d2acec7a00c94c4e5e9400a8.1447689401.git.alex.suykov@gmail.com>
 <564A3A5F.3010301@mind.be>
Message-ID: <20151116215244.GA8630@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mon, Nov 16, 2015 at 09:19:43PM +0100, Arnout Vandecappelle wrote:

> > +	  ChromeOS verified boot utils: futility and cgpt.
> 
>  ChromeOS or Chromius OS? Please be consistent :-)
 
Fixed that in v2 already. Should be Chromium OS throughout of course.
Chromium OS but Chrome-book.

> > +VBOOT_UTILS_VERSION = bbdd62f9b030db7ad8eef789aaf58a7ff9a25656
> > +VBOOT_UTILS_SITE = https://chromium.googlesource.com/chromiumos/platform/vboot_reference
> 
>  Since googlesource is shutting down: is there an alternative location already?
> Possibly one which doesn't require git download method?

Isn't it Google Code that's shutting down?
It does not look like they have any other site for Chromium OS sources.
https://www.chromium.org/chromium-os/developer-guide#TOC-Get-the-Source

They do have tgz shapshots however, I overlooked that.
Should be better than git checkouts.
