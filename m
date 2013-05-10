From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 18:27:28 +0200
Subject: [Buildroot] [PATCH] linux.mk: change linux tarball compression
 to xz
In-Reply-To: <20130510162239.GA8882@trismegisto.universo>
References: <1368175909-17855-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20130510162239.GA8882@trismegisto.universo>
Message-ID: <20130510182728.18662a14@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ra?l S?nchez Siles,

On Fri, 10 May 2013 18:22:39 +0200, Ra?l S?nchez Siles wrote:

> On Fri, May 10, 2013 at 10:51:48AM +0200, Jerzy Grzegorek wrote:
> > After selecting BR2_LINUX_KERNEL or BR2_LINUX_KERNEL_CUSTOM_VERSION 
> > configuration item, if any of linux tarball linux-$(LINUX_VERSION).tar.xx
> > in local download tarball directory $(BR2_DL_DIR) exists, it used should be,
> > otherwise *we* set the compression of linux tarball to download to xz.
> 
>   What about the one I'm attaching?

This one works if we're sure that all the 3.x and 2.6 versions of the
Linux kernel, as hosted on kernel.org, are available as .xz.

Looking at https://www.kernel.org/pub/linux/kernel/v2.6/ and
https://www.kernel.org/pub/linux/kernel/v3.x/ it indeed seems to be the
case, so looks like your patch should be go to go.

Could you resend your patch inline, with 'git send-email', so that it
can be reviewed and Acked-by other developers, and hopefully applied?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
