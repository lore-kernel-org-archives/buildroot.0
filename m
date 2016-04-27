From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 27 Apr 2016 10:14:29 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi3: sync kernel
 version with rpi/rpi2
In-Reply-To: <CALtfCQZ5NWOoTA6PP+ZwXXTkTj=aUrP5PpVB6miiTxjo55ur8Q@mail.gmail.com>
References: <CALtfCQbtz27yZXAOf+rZpE7y1LOV5TzTT2e5dUbk7ov-RQEy5A@mail.gmail.com>
 <878u00o2oi.fsf@dell.be.48ers.dk>
 <CALtfCQbwAPAwPjyyoY6bLdzsg3i86ZrC8bQor1ycbx8VBKm9og@mail.gmail.com>
 <874maoo0al.fsf@dell.be.48ers.dk> <87wpnkmf65.fsf@dell.be.48ers.dk>
 <20160426213916.241241c7@gmx.net>,
 <CALtfCQZ5NWOoTA6PP+ZwXXTkTj=aUrP5PpVB6miiTxjo55ur8Q@mail.gmail.com>
Message-ID: <trinity-67ea5529-3e2f-4e63-958e-d5d4f6463b14-1461744869554@3capp-gmx-bs18>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Oscar,

> Gesendet:?Mittwoch, 27. April 2016 um 08:58 Uhr
> Von:?"Oscar Gomez Fuente" <oscargomezf@gmail.com>
> An:?"Peter Seiderer" <ps.report@gmx.net>
> Cc:?buildroot at busybox.net
> Betreff:?Re: [Buildroot] [git commit] configs/raspberrypi3: sync kernel version with rpi/rpi2
> 
> Hi everyone,
> ?
> I've checked rpi1 sdcard.img and rpi2 sdcard.img images and works fine. With the rpi3 sdcard.img I can't see the serial port > working, I tried to add overlays/pi3-disable-bt-overlay.dtb and 'dtoverlay=pi3-disable-bt' to the config.txt file?to the boot > partition but it doesn't work.
> ?
?
in case your overlay is named 'pi3-disable-bt-overlay.dtb' and not 'pi3-disable-bt-overlay.dtbo' your are using
an old version of the rpi-firmware package..., please update/rebuild (and use patch [1])...

Regards (and excuse for top posting, no proper,
Peter

[1] https://patchwork.ozlabs.org/patch/614715/

> Best regards.
> ?
> 
> ?scar G?mez Fuente
> Electronic Engineer & Degree in Physical Sciences
