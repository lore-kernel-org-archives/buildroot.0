From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 8 Dec 2015 16:11:02 -0500
Subject: [Buildroot] [PATCH 1/2] vboot-utils: new package
In-Reply-To: <20151116215244.GA8630@vostro>
References: <cover.1447689401.git.alex.suykov@gmail.com>
 <39f87349d2f42ac5d2acec7a00c94c4e5e9400a8.1447689401.git.alex.suykov@gmail.com>
 <564A3A5F.3010301@mind.be> <20151116215244.GA8630@vostro>
Message-ID: <20151208211102.GR11489@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16 Nov 2015 23:52, Alex Suykov wrote:
> Mon, Nov 16, 2015 at 09:19:43PM +0100, Arnout Vandecappelle wrote:
> 
> > > +	  ChromeOS verified boot utils: futility and cgpt.
> > 
> >  ChromeOS or Chromius OS? Please be consistent :-)
>  
> Fixed that in v2 already. Should be Chromium OS throughout of course.
> Chromium OS but Chrome-book.

mmm, it should be "Chromium OS" and "Chrome OS", but it should be "Chromebook"

> > > +VBOOT_UTILS_VERSION = bbdd62f9b030db7ad8eef789aaf58a7ff9a25656
> > > +VBOOT_UTILS_SITE = https://chromium.googlesource.com/chromiumos/platform/vboot_reference
> > 
> >  Since googlesource is shutting down: is there an alternative location already?
> > Possibly one which doesn't require git download method?
> 
> Isn't it Google Code that's shutting down?
> It does not look like they have any other site for Chromium OS sources.
> https://www.chromium.org/chromium-os/developer-guide#TOC-Get-the-Source
> 
> They do have tgz shapshots however, I overlooked that.
> Should be better than git checkouts.

unfortunately, the tgz snapshots are not stable (same code but diff hash).
there's a bug open to get it fixed, but i don't know when/if it'll change :(.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151208/89878b60/attachment.asc>
