From: michal.lyszczek at bofc.pl <michal.lyszczek@bofc.pl>
Date: Mon, 18 Nov 2019 19:11:13 +0100
Subject: [Buildroot] USB on rock64
In-Reply-To: <gYbwmuK12iczoJF4lBzTCVCt4DX12_SVF-aghiLMzD4CAwEAg1D8CIepuT9X89EJcalxmpDVDwN3nDwv50H-CLzPX1X-U3JZFtgbVmO_A5o=@protonmail.com>
References: <Jrdyl_Hac9BdPOhYDWt4FafgynThsUwezL988o5hous9u1y2phHJn7RMUehQbousCfsFYXHqbVjj4ZHFSvj2GApa6f2ZNcnkUFIkzlcb5io=@protonmail.com>
 <2f439898-5420-2413-3b4e-533ab124682a@mind.be>
 <gYbwmuK12iczoJF4lBzTCVCt4DX12_SVF-aghiLMzD4CAwEAg1D8CIepuT9X89EJcalxmpDVDwN3nDwv50H-CLzPX1X-U3JZFtgbVmO_A5o=@protonmail.com>
Message-ID: <20191118181113.3vi3zklvuibaxfk6@c-ml-p3510.redembedded.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello noone I know
On 2019-11-18 14:16:28, no-one-you-know wrote:
> > Have you tried with other devices? USB3 flash drives don't
> > always work well in USB2 ports (yes, they should, but they
> > don't...). A mouse is often a much better device for testing.
> 
> Hello - thanks for responding.
> 
> Yes, I tried with a USB2 flash drive and a USB keyboard.  Nothing
> detected.  I'm reasonably confident it's the kernel rather than a
> missing package because I used the same uboot/kernel with a
> different rootfs and have the same behaviour.

I've just compiled rock64_defconfig from master and USB does ineed
work, I checked USB3 and USB2 pendrives and keyboard but...

Only 1 USB port seems to work - bottom USB2.0. I remember there
were some issues with USB3 at the time I did the port, but cannot
remember why the upper USB2 does not work, maybe some regulator is
not enabled in default dtb?

Try different USB port and see if that works.
