From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Oct 2014 07:00:17 +0100
Subject: [Buildroot] [PATCH 0/15 v6] Introduce libudev (branch
	yem/libudev2)
References: <cover.1414442699.git.yann.morin.1998@free.fr>
 <XnsA3D3E6DF040E0berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <545008BC.90706@mind.be>
Message-ID: <XnsA3D547413CDD6berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> wrote in
news:545008BC.90706 at mind.be: 

>  With "worked", you do mean that it works at runtime, right? Because the
>  problem 
> with this change is to be sure that the packages still function
> correctly when the udev daemon is not running.

Hi,

yes. I am using xbmc/kodi with mesa3d, libcec and X.org on a system
without the udev daemon but with libudev for several months now without
problems. 

Regards, Bernd
