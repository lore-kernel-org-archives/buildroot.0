From: Hoang Tran <hoang.tran@vnoss.org>
Date: Mon, 15 Jun 2015 10:46:08 -0400
Subject: [Buildroot] [PATCH 1/1] fs/romfs: add U-Boot image support
In-Reply-To: <20150614232937.6805b496@free-electrons.com>
References: <1433782196-17824-1-git-send-email-hoang.tran@vnoss.org>
 <20150614232937.6805b496@free-electrons.com>
Message-ID: <CAEiL7jJV6kaRnfi1HnSJEzrfaO_bQ4_dF+bX0p15wewC0QqOkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > Adds U-Boot image support for romfs root filesystems. This allows you to
> > use the bootm command in U-Boot to load the rootfs.
> >
> > Signed-off-by: Hoang Tran <hoang.tran@vnoss.org>
> > ---
> >  fs/romfs/Config.in | 13 +++++++++++++
> >  fs/romfs/romfs.mk  | 10 +++++++++-
> >  2 files changed, 22 insertions(+), 1 deletion(-)
>
> Considering the absence of reaction to Arnout's comment about your
> patch, I've marked it as 'Rejected' in our patch tracking system. Of
> course, if you believe the patch is still useful despite Arnout
> comment, do not hesitate to resend an updated version with an extended
> justification.

Dear Thomas, Arnout,

Sorry I did not response because of the problem of my email client.
But anyway I agree with Arnout.
My rootfs is in romfs and I intended to make a uRamdisk for quick testing.
But we could use cpio Ramdisk instead.

Regards,
Hoang
