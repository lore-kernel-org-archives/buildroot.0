From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 25 Jan 2015 11:38:14 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-01-24
In-Reply-To: <20150125073015.49B3C1013EF@stock.ovh.net>
References: <20150125073015.49B3C1013EF@stock.ovh.net>
Message-ID: <54C4C796.5080809@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

El 25/01/15 a las 08:30, Thomas Petazzoni escribi?:
> Build statistics for 2015-01-24
> ===============================

>      mips64el |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/3b455db77cf93ee901cb0747f51206b0588b21dc/

This is an OpenCV issue. Reported upstream:
   http://code.opencv.org/issues/3931

>      mips64el |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/0957c111cb9078602d0d95e1f4ada193b2c1bf58/

This is weird. Shouldn't be fixed by this?

 
http://git.buildroot.net/buildroot/commit/?id=1d21e4c397cbd92d03d09daf4fadffaa79959f55

>          mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/9a6db398bdae9bb454dcb1cb07f3894e6c59fe7d/
>          mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/a27458e2d55e3c9fd6565850b0e2f394266bfd85/
>        mipsel |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/86495adec2676b0e8267f5bfba2e23921066fd9b/

Reported upstream:

 
http://lists.ximian.com/pipermail/mono-devel-list/2015-January/042696.html

>      mips64el |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/cf77fa21149c69b6105daf540809de53464390c7/

Will be fixed by this:

   http://lists.busybox.net/pipermail/buildroot/2015-January/116997.html

Regards,
--
Vincent
