From: Kees van Unen <Keesvanunen@hotmail.com>
Date: Sat, 21 Oct 2017 14:07:42 -0700 (MST)
Subject: [Buildroot] Implicit declaration of mblen
In-Reply-To: <0836e4ea-a773-fbe0-4c52-4414ad82389c@mind.be>
References: <1508584234482-0.post@n4.nabble.com>
 <87bml0cvqq.fsf@dell.be.48ers.dk> <1508618665952-0.post@n4.nabble.com>
 <0836e4ea-a773-fbe0-4c52-4414ad82389c@mind.be>
Message-ID: <1508620062609-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> This line looks pretty suspicious: 

>BR2_EXTRA_GCC_CONFIG_OPTIONS="-I/home/pi/Downloads/buildroot-2017.08/output/host/bassie" 

> Maybe that causes a wrong stlib.h somewhere? 

Quoted line was leftover from test. Uploaded new defconfig with same issue.

Kees

mblen_error.mblen_error
<http://buildroot-busybox.2317881.n4.nabble.com/file/t2263/mblen_error.mblen_error>  
raspberrypi0_defconfig.raspberrypi0_defconfig
<http://buildroot-busybox.2317881.n4.nabble.com/file/t2263/raspberrypi0_defconfig.raspberrypi0_defconfig>  




--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
