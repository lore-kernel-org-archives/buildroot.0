From: no-one-you-know <octomp@protonmail.com>
Date: Mon, 18 Nov 2019 14:16:28 +0000
Subject: [Buildroot] USB on rock64
In-Reply-To: <2f439898-5420-2413-3b4e-533ab124682a@mind.be>
References: <Jrdyl_Hac9BdPOhYDWt4FafgynThsUwezL988o5hous9u1y2phHJn7RMUehQbousCfsFYXHqbVjj4ZHFSvj2GApa6f2ZNcnkUFIkzlcb5io=@protonmail.com>
 <2f439898-5420-2413-3b4e-533ab124682a@mind.be>
Message-ID: <gYbwmuK12iczoJF4lBzTCVCt4DX12_SVF-aghiLMzD4CAwEAg1D8CIepuT9X89EJcalxmpDVDwN3nDwv50H-CLzPX1X-U3JZFtgbVmO_A5o=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Have you tried with other devices? USB3 flash drives don't always work well in
> USB2 ports (yes, they should, but they don't...). A mouse is often a much better
> device for testing.

Hello - thanks for responding.

Yes, I tried with a USB2 flash drive and a USB keyboard.  Nothing detected.
I'm reasonably confident it's the kernel rather than a missing package because I used the same uboot/kernel with a different rootfs and have the same behaviour.
