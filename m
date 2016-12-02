From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Dec 2016 20:40:21 +0100
Subject: [Buildroot] [PATCH] libinput: bump to version 1.5.2
In-Reply-To: <1480700554-1264-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 2 Dec 2016 14:42:34 -0300")
References: <1480700554-1264-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87oa0u6rx6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

> ---
 >  package/libinput/libinput.hash | 4 ++--
 >  package/libinput/libinput.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
 > index 10c5e9d..ea7bdf7 100644
 > --- a/package/libinput/libinput.hash
 > +++ b/package/libinput/libinput.hash
 > @@ -1,2 +1,2 @@
 > -# From https://lists.freedesktop.org/archives/wayland-devel/2016-September/031054.html
 > -sha256	5a96559385ecfaa30f9e72ea89eb8ebbc97caf68e458f451f4ed62315311081c	libinput-1.5.0.tar.xz
 > +# From https://lists.freedesktop.org/archives/wayland-devel/2016-November/031926.html
 > +sha256	ba26e2bc64ed551eaef193178ed06b07b97a09ac6f4e442f5f15bbc3f3174682	libinput-1.5.2.tar.xz
 > diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
 > index 2005c47..765a3cb 100644
 > --- a/package/libinput/libinput.mk
 > +++ b/package/libinput/libinput.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -LIBINPUT_VERSION = 1.5.0
 > +LIBINPUT_VERSION = 1.5.2
 >  LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 >  LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 >  LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
 > -- 
 > 2.7.3

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
