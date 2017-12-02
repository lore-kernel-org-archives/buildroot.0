From: Keith Mok <ek9852@gmail.com>
Date: Fri, 1 Dec 2017 22:20:06 -0800
Subject: [Buildroot] [PATCH 2/2] android-tools: upport char, block, fifo,
 socket devices
In-Reply-To: <20171201135528.16e0c342@windsurf.lan>
References: <20171130205631.93251-1-ek9852@gmail.com>
 <20171130205631.93251-2-ek9852@gmail.com>
 <20171201135528.16e0c342@windsurf.lan>
Message-ID: <CAHjoi4fkKs+ChWaWM6GVeZHsvD+Q_RWHwU-6BRJbRV2RTM0YSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wil try to submit to AOSP for [PATCH 2/2].
But for [PATCH 1/1] it is not a features batch. The debian package already
have the make_ext4fs, we ust miss the makefile in buildroot.

2017-12-01 4:55 GMT-08:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> Thanks for your contributions! See below for a few comments/questions.
>
> On Thu, 30 Nov 2017 12:56:31 -0800, Keith Mok wrote:
> > Pick changes from openwrt to enable support of special
> > device for make_ext4fs
>
> Missing Signed-off-by line.
>
> > ---
> >  ...ment-support-for-block-and-char-dev-nodes.patch | 109
> +++++++++++++++++++++
> >  1 file changed, 109 insertions(+)
> >  create mode 100644 package/android-tools/0009-
> PATCH-Implement-support-for-block-and-char-dev-nodes.patch
> >
> > diff --git a/package/android-tools/0009-PATCH-Implement-support-for-block-and-char-dev-nodes.patch
> b/package/android-tools/0009-PATCH-Implement-support-for-
> block-and-char-dev-nodes.patch
> > new file mode 100644
> > index 0000000..e86d9c6
> > --- /dev/null
> > +++ b/package/android-tools/0009-PATCH-Implement-support-for-
> block-and-char-dev-nodes.patch
> > @@ -0,0 +1,109 @@
> > +From 3258b175c3ea1f76823c6b69b5036ac7efb5599d Mon Sep 17 00:00:00 2001
> > +From: Jo-Philipp Wich <jow@openwrt.org>
> > +Date: Thu, 30 Nov 2017 10:10:24 -0800
> > +Subject: [PATCH] [PATCH] Implement support for block and char dev
> nodes, fifos
> > + and sockets.
> > +
> > +Signed-off-by: Jo-Philipp Wich <jow@openwrt.org>
> > +Signed-off-by: Keith Mok <ek9852@gmail.com>
>
> This really is a feature patch, and we don't like to take features
> patches in Buildroot (unlike OpenWRT). Indeed, those are often a pain
> to maintain over time.
>
> Do you see any possibility of this being merged upstream? I do realize
> that the upstream for android-tools is somewhat unusual, and that
> getting contributions accepted might be more challenging than with
> other open source projects. But still I'd like to hear about what has
> been tried to push this upstream.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171201/a5a8e97c/attachment.html>
