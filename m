From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 4 Feb 2014 09:41:30 +0100
Subject: [Buildroot] [PATCH v6 4/5] systemd: bump to v207.
In-Reply-To: <CAAXf6LWtpJ5j04oRE8j+Msbrurf=oJ2OGsUOj20kFNQM-j0rLQ@mail.gmail.com>
References: <1389627907-7821-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1389627907-7821-5-git-send-email-eric.le.bihan.dev@free.fr>
 <CAAXf6LWtpJ5j04oRE8j+Msbrurf=oJ2OGsUOj20kFNQM-j0rLQ@mail.gmail.com>
Message-ID: <CAHXCMM+f2Ld8J9KNE5GZjc04v_M0Qm5KrUV2Q1WVTyi_OTS81A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,


On Mon, Feb 3, 2014 at 11:10 PM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> Hi Eric,
>
> On Mon, Jan 13, 2014 at 4:45 PM, Eric Le Bihan
> <eric.le.bihan.dev@free.fr> wrote:
>
[..]
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index a5dc8e5..bca3058 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -4,75 +4,117 @@
> >  #
> >
>  ################################################################################
> >
> > -SYSTEMD_VERSION = 44
> > +SYSTEMD_VERSION = 207
> >  SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
> >  SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
> >  SYSTEMD_LICENSE = GPLv2+
> > -SYSTEMD_LICENSE_FILES = LICENSE
> > +SYSTEMD_LICENSE_FILES = LICENSE.GPLV2 LICENSE.LGPL2.1 LICENSE.MIT
> >  SYSTEMD_INSTALL_STAGING = YES
> >  SYSTEMD_DEPENDENCIES = \
> >         host-intltool \
> >         libcap \
> > -       udev \
> > -       dbus
> > +       dbus \
> > +       util-linux \
> > +       kmod
>
It seems systemd also depends on host-gperf

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140204/6104e370/attachment.html>
