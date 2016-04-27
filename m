From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 27 Apr 2016 10:19:17 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi3: sync kernel
 version with rpi/rpi2
In-Reply-To: <CALtfCQZvVXb-6e_2DHGEBGw=aad3KJGefK-ekBSc=r3+WK_c3Q@mail.gmail.com>
References: <CALtfCQbtz27yZXAOf+rZpE7y1LOV5TzTT2e5dUbk7ov-RQEy5A@mail.gmail.com>
 <878u00o2oi.fsf@dell.be.48ers.dk>
 <CALtfCQbwAPAwPjyyoY6bLdzsg3i86ZrC8bQor1ycbx8VBKm9og@mail.gmail.com>
 <874maoo0al.fsf@dell.be.48ers.dk> <87wpnkmf65.fsf@dell.be.48ers.dk>
 <20160426213916.241241c7@gmx.net>
 <CALtfCQZ5NWOoTA6PP+ZwXXTkTj=aUrP5PpVB6miiTxjo55ur8Q@mail.gmail.com>,
 <CALtfCQZvVXb-6e_2DHGEBGw=aad3KJGefK-ekBSc=r3+WK_c3Q@mail.gmail.com>
Message-ID: <trinity-47ec2dfc-3384-4591-8442-12c40f62c3d0-1461745157718@3capp-gmx-bs18>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Oscar,

> Gesendet:?Mittwoch, 27. April 2016 um 09:28 Uhr
> Von:?"Oscar Gomez Fuente" <oscargomezf@gmail.com>
> An:?"Peter Seiderer" <ps.report@gmx.net>
> Cc:?"Peter Korsgaard" <peter@korsgaard.com>, buildroot at busybox.net
> Betreff:?Re: [Buildroot] [git commit] configs/raspberrypi3: sync kernel version with rpi/rpi2
> 
> Hi everyone,
> ?
> I made a git clone from buildroot?with the last repo, and It works fine with rpi1 and rp2. I want to check?rpi3 too so I've > > tried to select DTB overlays (Target packages > Hardware handling > Firmware > Install DTB overlays) but it didn't generate > > the overlay folder in output/images/rpi-firmware.
> ?
> Does anyone knows why?
> ?

You need to rebuild the rpi-firmware package after changing the config option (make rpi-firmware-dirclean; make)
and apply patch [1] first...

Regards,
Peter

[1] https://patchwork.ozlabs.org/patch/614715/


> Best regards.
> ?
> 
> ?scar G?mez Fuente
> Electronic Engineer & Degree in Physical Sciences
