From: =?iso-8859-1?Q?Ra=FAl_S=E1nchez?= Siles <rasasi78@gmail.com>
Date: Fri, 10 May 2013 18:22:39 +0200
Subject: [Buildroot] [PATCH] linux.mk: change linux tarball compression
 to xz
In-Reply-To: <1368175909-17855-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1368175909-17855-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20130510162239.GA8882@trismegisto.universo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi:

On Fri, May 10, 2013 at 10:51:48AM +0200, Jerzy Grzegorek wrote:
> After selecting BR2_LINUX_KERNEL or BR2_LINUX_KERNEL_CUSTOM_VERSION 
> configuration item, if any of linux tarball linux-$(LINUX_VERSION).tar.xx
> in local download tarball directory $(BR2_DL_DIR) exists, it used should be,
> otherwise *we* set the compression of linux tarball to download to xz.

  What about the one I'm attaching?

  Regards,
-- 
Ra?l S?nchez Siles
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Choose-xz-compressed-tarball-for-linux-kernel.patch
Type: text/x-diff
Size: 1517 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130510/83639513/attachment.bin>
