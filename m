From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Jul 2014 14:38:48 +0200
Subject: [Buildroot] [PATCH 20/20 v3] package/xserver_xorg-server: needs
	libudev, not a udev daemon
References: <cover.1405777634.git.yann.morin.1998@free.fr>
 <7964be0c75358121baa69301d23eb93d72a64db9.1405777634.git.yann.morin.1998@free.fr>
 <XnsA3777C2F4BB23berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20140727143111.7f5091a0@free-electrons.com>
Message-ID: <XnsA37794FEB18FDberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20140727143111.7f5091a0 at free-electrons.com:

> That's the kind of thing that worries me about the idea of allowing
> only libudev to be installed without the udev daemon running. I believe
> libudev and the udev daemon are meant to be used together, and we're
> likely to fall into various issues by allowing libudev to be installed
> separately from the udev daemon.

Hi Thomas,

and thats exactly the reason why I suggest to switch only those packages over 
to libudev which are proven to work without the udev daemon. This is true for 
mesa3d/libcec/xbmc/libdrm/xdriver_xf86-video-intel, the packages I am using 
on my non-udev-daemon system.

Regards, Bernd
