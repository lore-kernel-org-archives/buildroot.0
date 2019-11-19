From: no-one-you-know <octomp@protonmail.com>
Date: Tue, 19 Nov 2019 01:15:42 +0000
Subject: [Buildroot] USB on rock64
In-Reply-To: <20191118181113.3vi3zklvuibaxfk6@c-ml-p3510.redembedded.pl>
References: <Jrdyl_Hac9BdPOhYDWt4FafgynThsUwezL988o5hous9u1y2phHJn7RMUehQbousCfsFYXHqbVjj4ZHFSvj2GApa6f2ZNcnkUFIkzlcb5io=@protonmail.com>
 <2f439898-5420-2413-3b4e-533ab124682a@mind.be>
 <gYbwmuK12iczoJF4lBzTCVCt4DX12_SVF-aghiLMzD4CAwEAg1D8CIepuT9X89EJcalxmpDVDwN3nDwv50H-CLzPX1X-U3JZFtgbVmO_A5o=@protonmail.com>
 <20191118181113.3vi3zklvuibaxfk6@c-ml-p3510.redembedded.pl>
Message-ID: <_327ATNlLeGeTfyZzNSX9hYyYtKaGkmFJ9cdS27eHJ3yyuMZb9m226Y9QXX15Jm4vmVVAMCntRXajj8e06WP0qwx6lPYXM_yt8XaUeR7V28=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I've just compiled rock64_defconfig from master and USB does ineed
> work, I checked USB3 and USB2 pendrives and keyboard but...
>
> Only 1 USB port seems to work - bottom USB2.0. I remember there
> were some issues with USB3 at the time I did the port, but cannot
> remember why the upper USB2 does not work, maybe some regulator is
> not enabled in default dtb?
>
> Try different USB port and see if that works.

Weird, I get nothing on any port with a USB2 flash drive and a USB keyboard.

I was using the 2018.08 version with quite a few different options set.  I'm assuming that when you compiled it you left everything default so I'll give that a go with the latest rc version and see what happens.

Thanks for helping.
