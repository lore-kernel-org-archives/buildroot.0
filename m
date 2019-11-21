From: no-one-you-know <octomp@protonmail.com>
Date: Thu, 21 Nov 2019 16:01:50 +0000
Subject: [Buildroot] USB on rock64
In-Reply-To: <20191119065437.n5spgsmskh74mozk@c-ml-p3510.redembedded.pl>
References: <Jrdyl_Hac9BdPOhYDWt4FafgynThsUwezL988o5hous9u1y2phHJn7RMUehQbousCfsFYXHqbVjj4ZHFSvj2GApa6f2ZNcnkUFIkzlcb5io=@protonmail.com>
 <2f439898-5420-2413-3b4e-533ab124682a@mind.be>
 <gYbwmuK12iczoJF4lBzTCVCt4DX12_SVF-aghiLMzD4CAwEAg1D8CIepuT9X89EJcalxmpDVDwN3nDwv50H-CLzPX1X-U3JZFtgbVmO_A5o=@protonmail.com>
 <20191118181113.3vi3zklvuibaxfk6@c-ml-p3510.redembedded.pl>
 <_327ATNlLeGeTfyZzNSX9hYyYtKaGkmFJ9cdS27eHJ3yyuMZb9m226Y9QXX15Jm4vmVVAMCntRXajj8e06WP0qwx6lPYXM_yt8XaUeR7V28=@protonmail.com>
 <20191119065437.n5spgsmskh74mozk@c-ml-p3510.redembedded.pl>
Message-ID: <7oIRgMc5LA7v_Q-nW4La4JEyuQMESCKfvUfWLjUTR6sCnURZQgkUkg3C1OJ19QVD35-c0vVEJl5GodFTh1IjeV_ZqzYO7ImqqkGo08qMi9w=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Default buildroot config for rock64 uses mainline kernel with
> default arch's generic defconfig which is not tailored for rock64.
> It might be possible that you have some newer revision than mine,
> which is not fully supported in mainline kernel. Couple of things
> to consider:
>
> 1.  you might want to change kernel version to newest one, maybe
>     your board is better supported in newer kernel.

Just one more thing on this...
I rebuilt my image using 2019.11.rc2 and kernel 5.3 (from the menuconfig options) and my USB2 ports are working now :)

Thanks again for the advice.
