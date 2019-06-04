From: Guo Ren <guoren@kernel.org>
Date: Tue, 4 Jun 2019 16:34:36 +0800
Subject: [Buildroot] [PATCH 1/2] package/qemu: Move patches to version
 directory
In-Reply-To: <20190604095605.7c9e7ef1@thl530.multi.box>
References: <1559564887-4088-1-git-send-email-guoren@kernel.org>
 <20190604095605.7c9e7ef1@thl530.multi.box>
Message-ID: <CAJF2gTTf4WoMvYwgeEKu5QXnn5U9UoFDC6MFUvhhYwrnZqHSYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jun 4, 2019 at 3:56 PM Thomas Huth <huth@tuxfamily.org> wrote:
>
> Am Mon,  3 Jun 2019 20:28:06 +0800
> schrieb guoren at kernel.org:
>
> > From: Guo Ren <ren_guo@c-sky.com>
> >
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > ---
> >  ...ix-usage-of-mcontext-structure-on-ARM-uCl.patch | 35 -------------
> >  .../qemu/0002-configure-improve-usbfs-check.patch  | 60
> > ---------------------- ...ix-usage-of-mcontext-structure-on-ARM-uCl.patch
> > | 35 +++++++++++++ .../3.1.0/0002-configure-improve-usbfs-check.patch
> > | 60 ++++++++++++++++++++++ 4 files changed, 95 insertions(+), 95
> > deletions(-) delete mode 100644
> > package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> > delete mode 100644
> > package/qemu/0002-configure-improve-usbfs-check.patch create mode
> > 100644
> > package/qemu/3.1.0/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
> > create mode 100644
> > package/qemu/3.1.0/0002-configure-improve-usbfs-check.patch
>
> At least the usbfs patch seems to be included in QEMU v4.0, so maybe it
> would be better to bump the version to 4.0 first?
I've no idea about qemu 4.0 and these patch can't apply to
csky-qemu-3.0. So I need to move them
to their own version's directory.

Best Regards
 Guo Ren
