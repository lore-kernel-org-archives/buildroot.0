From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Apr 2016 10:35:36 +0200
Subject: [Buildroot] [RPi 3B] ttyAMA0 serial port device doesn't exist
	on raspberry pi 3B
In-Reply-To: <CALtfCQbWTred7-+vv=mozXqws5Z5vLtu0MpC9kW1RYfCecT2nA@mail.gmail.com>
 (Oscar Gomez Fuente's message of "Thu, 21 Apr 2016 16:58:08 +0200")
References: <CALtfCQatSKG7Afgd=Z5bbp69h3UfTDKd+3GX6_zcVfcYqFaEhA@mail.gmail.com>
 <87ega1e3g5.fsf@dell.be.48ers.dk>
 <CALtfCQbWTred7-+vv=mozXqws5Z5vLtu0MpC9kW1RYfCecT2nA@mail.gmail.com>
Message-ID: <87ziskracn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:

 > Thank you Peter,
 > Only you have to add this line in the config.txt file:

 > device_tree=bcm2710-rpi-3-b.dtb
 > +dtoverlay=pi3-disable-bt

 > And copy the file pi3-disable-bt-overlay.dtb to /boot/overlays folder.

 > This disabled the Bluetooth module.

Ok, thanks - But longer term I guess we want to support bluetooth/wifi
on the rpi3.

-- 
Venlig hilsen,
Peter Korsgaard 
