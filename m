From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 30 Apr 2019 09:22:52 -0400
Subject: [Buildroot] [PATCH v3 04/10]
 package/gstreamer1/gst1-plugins-{base, good, bad, ugly}: bump to 1.16.0
In-Reply-To: <uvclpfxhjh.ln2@ID-313208.user.individual.net>
References: <20190424210333.62571-1-aduskett@gmail.com>
 <20190424210333.62571-4-aduskett@gmail.com>
 <uvclpfxhjh.ln2@ID-313208.user.individual.net>
Message-ID: <CAFSsvmpyo3u+sFGYDPj9rZEb9WLRbTZotyrM2mC-xKzxJKLOug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sigh, ok, I will get to it and submit a v4....

On Tue, Apr 30, 2019 at 4:19 AM Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> Am Wed, 24 Apr 2019 17:03:27 -0400 schrieb
> aduskett-Re5JQEeQqe8AvxtiuMwx3w:
>
> > diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> > index fb976f9a94..57d0cbd436 100644
> > --- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> > +++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> > @@ -4,11 +4,11 @@
> >  #
> >
> ################################################################################
> >
> > -GST1_PLUGINS_BASE_VERSION = 1.14.4
> > +GST1_PLUGINS_BASE_VERSION = 1.16.0
> >  GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$
> (GST1_PLUGINS_BASE_VERSION).tar.xz
> >  GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-
> plugins-base
> >  GST1_PLUGINS_BASE_INSTALL_STAGING = YES
> > -GST1_PLUGINS_BASE_LICENSE_FILES = COPYING.LIB
> > +GST1_PLUGINS_BASE_LICENSE_FILES = COPYING
> >  GST1_PLUGINS_BASE_LICENSE = LGPL-2.0+, LGPL-2.1+
> >
> >  # gio_unix_2_0 is only used for tests
>
> Hi Adam,
>
> ftr: This patch needs a rebase after
> https://git.buildroot.net/buildroot/commit/?
> id=80a5217476c45e765db45acd8782f7f854783f93
>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
