From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Apr 2016 22:41:46 +0200
Subject: [Buildroot] [RPi 3B] ttyAMA0 serial port device doesn't exist
	on raspberry pi 3B
In-Reply-To: <CALtfCQatSKG7Afgd=Z5bbp69h3UfTDKd+3GX6_zcVfcYqFaEhA@mail.gmail.com>
 (Oscar Gomez Fuente's message of "Tue, 19 Apr 2016 13:23:31 +0200")
References: <CALtfCQatSKG7Afgd=Z5bbp69h3UfTDKd+3GX6_zcVfcYqFaEhA@mail.gmail.com>
Message-ID: <87ega1e3g5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:

 > Hi everyone,
 > I'm using buildroot-2016.02 and I'm trying to make a rootfs for the
 > raspberry pi 3B. I've just used the raspberrypi2_defconfig. And everything
 > works fine except the serial port /dev/ttyAMA0.... I can see characters on
 > the serial port but they are garbage characters...

 > This is my config.txt, I'm using the bcm2710-rpi-3-b.dtb file:

I believe ttyAMA0 is connected to the bluetooth module on rpi3 and you instead
need to use ttyS0:

https://www.raspberrypi.org/forums/viewtopic.php?f=29&t=138120

-- 
Bye, Peter Korsgaard
