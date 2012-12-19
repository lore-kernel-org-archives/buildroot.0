From: Charles Manning <cdhmanning@gmail.com>
Date: Thu, 20 Dec 2012 11:20:15 +1300
Subject: [Buildroot] Any way to override .config settings?
Message-ID: <CAE21AQpSdqfXmX1Kv97LHQP_kqEqC9FH+rwU70ZZAPS-Xt4_DA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi buildrooters

I need to be able to build a system from an svn repository using a
bunch of different revisions for different elements. For example, I
might want to use the kernel at r 1234, u-boot at r 4567 and the
rootfs+apps at r 3344.

Now I could achieve this by going into the .config with menuconfig and
changing the config, but I would prefer to be able to have a file of
revisions to use and have buildroot pick up those revision symbols
instead.

I guess there are a few ways this could be handled:

1) Is there a built in mechanism in buildroot to include extra symbols
and override those in .config?

2) Run my own script that nobbles the .config using sed etc.

Is there something built in to buildroot that will do this?

Thanks

Charles
