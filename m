From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Apr 2016 09:08:49 +0200
Subject: [Buildroot] [PATCH 1/1] Raspberry PI 3 kernel,
	firmware and dtb update
In-Reply-To: <20160419213321.GG3505@free.fr> (Yann E. MORIN's message of "Tue, 
 19 Apr 2016 23:33:21 +0200")
References: <1459421492-18815-1-git-send-email-ubaldo@eja.it>
 <87a8kpe39z.fsf@dell.be.48ers.dk> <20160419213321.GG3505@free.fr>
Message-ID: <87wpnsdaf2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 >> The rpi3 afaik uses a different serial port than rpi2. How will that
 >> work if we use the same defconfig for both boards? Perhaps it makes more
 >> sense to have a seperate raspberrypi3_defconfig?

 > Yes, expecially since the CPU is not the same, andthat we may^Wwill one
 > day have it run in 64-bit mode (one can dream, no?).

Yeah. I don't know about the rpi foundation, but there seems to be quite
some aarch64 activity around it in mainline U-Boot/Linux.

With the recent vc4 work it might make sense to add rpi defconfigs using
mainline as well?

-- 
Venlig hilsen,
Peter Korsgaard 
