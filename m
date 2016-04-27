From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Apr 2016 08:50:04 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi3: sync kernel
	version with rpi/rpi2
In-Reply-To: <20160426213916.241241c7@gmx.net> (Peter Seiderer's message of
 "Tue, 26 Apr 2016 21:39:16 +0200")
References: <CALtfCQbtz27yZXAOf+rZpE7y1LOV5TzTT2e5dUbk7ov-RQEy5A@mail.gmail.com>
 <878u00o2oi.fsf@dell.be.48ers.dk>
 <CALtfCQbwAPAwPjyyoY6bLdzsg3i86ZrC8bQor1ycbx8VBKm9og@mail.gmail.com>
 <874maoo0al.fsf@dell.be.48ers.dk> <87wpnkmf65.fsf@dell.be.48ers.dk>
 <20160426213916.241241c7@gmx.net>
Message-ID: <87lh3z1r6r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

Hi,

 >> Just dd the sdcard.img matching your board variant to a sdcard. I've
 >> verified the rpi1 version here.
 
 > https://buildroot.org/~jacmet/rpi/rpi1/sdcard.img
 > Boots fine on a Raspberry Pi Model B Rev 2 board (console on HDMI and serial)

 > https://buildroot.org/~jacmet/rpi/rpi3/sdcard.img
 > Boots fine on a Raspberry Pi 3 Model B Rev 1.2 (messages on HDMI,
 > console on HDMI and serial after adding the 'dtoverlay=pi3-disable-bt' fix).

Thanks for testing! What is the behaviour without the dtoverlay? Similar
to Oscar, E.G. no serial output and unable to login over HDMI?

-- 
Venlig hilsen,
Peter Korsgaard 
