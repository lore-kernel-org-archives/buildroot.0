From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 08:53:44 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi3: sync kernel
	version with rpi/rpi2
In-Reply-To: <trinity-865bd3a6-6a65-4e11-a2f0-8214fd30d71b-1461745444837@3capp-gmx-bs18>
 (Peter Seiderer's message of "Wed, 27 Apr 2016 10:24:04 +0200")
References: <CALtfCQbtz27yZXAOf+rZpE7y1LOV5TzTT2e5dUbk7ov-RQEy5A@mail.gmail.com>
 <878u00o2oi.fsf@dell.be.48ers.dk>
 <CALtfCQbwAPAwPjyyoY6bLdzsg3i86ZrC8bQor1ycbx8VBKm9og@mail.gmail.com>
 <874maoo0al.fsf@dell.be.48ers.dk> <87wpnkmf65.fsf@dell.be.48ers.dk>
 <20160426213916.241241c7@gmx.net> <87lh3z1r6r.fsf@dell.be.48ers.dk>
 <trinity-865bd3a6-6a65-4e11-a2f0-8214fd30d71b-1461745444837@3capp-gmx-bs18>
Message-ID: <87fuu6z0jr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

Hi,

 >> > https://buildroot.org/~jacmet/rpi/rpi3/sdcard.img
 >> > Boots fine on a Raspberry Pi 3 Model B Rev 1.2 (messages on HDMI,
 >> > console on HDMI and serial after adding the 'dtoverlay=pi3-disable-bt' fix).
 >> 
 >> Thanks for testing! What is the behaviour without the dtoverlay? Similar
 >> to Oscar, E.G. no serial output and unable to login over HDMI?

 > Same/known behaviour as described already in [1]:

 >   Without the overlay I get boot messages on HDMI, but no login, last messages
 >   are from USB keyboard/mouse and I can get more messages removing/adding
 >   keyboard/mouse...., no messages on serial console (but 'ttyS0: 29 input overrun(s)
 >   message on HDMI output)

Ok. Care to send a patch to add the dtboverlay to the rpi3 defconfig?

-- 
Venlig hilsen,
Peter Korsgaard 
