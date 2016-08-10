From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 22:35:55 +0200
Subject: [Buildroot] raspberry-pi3 do not work on buildroot-2016.05.
In-Reply-To: <CAFN-Ez753CAapach8-OT+_HKb9zSQJORQ_imQdU+Z2y0OyRcvQ@mail.gmail.com>
References: <CAFN-Ez753CAapach8-OT+_HKb9zSQJORQ_imQdU+Z2y0OyRcvQ@mail.gmail.com>
Message-ID: <20160810223555.5ca9d42f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm adding in Cc Beno?t, Peter and Ubaldo. All of them have touched the
Raspberry Pi 3 defconfig in Buildroot, which most likely means they
have tested it.

Beno?t, Peter, Ubaldo, could one of you have a look at Chetan's issue
below, and double check the latest raspberrypi3_defconfig is working
for you?

Thanks!

Thomas

On Wed, 10 Aug 2016 15:55:21 +0100, Chetan Kumar wrote:
> Comrades,
> 
> I used raspberrypi3_defconfig on buildroot-2016.05 loaded the sdcard.img
> onto my raspberrypi-3, boots but get stuck at
> random: nonblocking pool is initialized
> 
> Tried same on buildroot-2016.08-rc1, it just works and get the login
> prompt.
> 
> Any clue ?
> 
> 
> Thanks
> C



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
