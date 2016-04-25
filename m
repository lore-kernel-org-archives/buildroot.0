From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Apr 2016 21:32:14 +0200
Subject: [Buildroot] [PATCH 1/1] Preliminary support for Raspberry Pi 3
	with symlink
In-Reply-To: <20160425211936.73f44f62@gmx.net> (Peter Seiderer's message of
 "Mon, 25 Apr 2016 21:19:36 +0200")
References: <1461442370-22393-1-git-send-email-ubaldo@eja.it>
 <871t5triwb.fsf@dell.be.48ers.dk>
 <81b71ac5323b1793405c3192b6ac5264@eja.it>
 <20160425211936.73f44f62@gmx.net>
Message-ID: <87lh41o56p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

Hi,

 > Same here on RPi3, but with the suggested fix from Oscar Gomez Fuente
 > [1], adding 'dtoverlay=pi3-disable-bt' to config.txt I get working
 > boot messages and login on HDMI and serial console...

Just to confirm, neither serial or HDMI works without the dtoverlay
line?

I see various references to a clocking issue with the "new" serial port,
perhaps that is related?

-- 
Venlig hilsen,
Peter Korsgaard 
