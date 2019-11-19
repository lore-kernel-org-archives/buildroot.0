From: no-one-you-know <octomp@protonmail.com>
Date: Tue, 19 Nov 2019 23:56:54 +0000
Subject: [Buildroot] USB on rock64
In-Reply-To: <20191119065437.n5spgsmskh74mozk@c-ml-p3510.redembedded.pl>
References: <Jrdyl_Hac9BdPOhYDWt4FafgynThsUwezL988o5hous9u1y2phHJn7RMUehQbousCfsFYXHqbVjj4ZHFSvj2GApa6f2ZNcnkUFIkzlcb5io=@protonmail.com>
 <2f439898-5420-2413-3b4e-533ab124682a@mind.be>
 <gYbwmuK12iczoJF4lBzTCVCt4DX12_SVF-aghiLMzD4CAwEAg1D8CIepuT9X89EJcalxmpDVDwN3nDwv50H-CLzPX1X-U3JZFtgbVmO_A5o=@protonmail.com>
 <20191118181113.3vi3zklvuibaxfk6@c-ml-p3510.redembedded.pl>
 <_327ATNlLeGeTfyZzNSX9hYyYtKaGkmFJ9cdS27eHJ3yyuMZb9m226Y9QXX15Jm4vmVVAMCntRXajj8e06WP0qwx6lPYXM_yt8XaUeR7V28=@protonmail.com>
 <20191119065437.n5spgsmskh74mozk@c-ml-p3510.redembedded.pl>
Message-ID: <j4bbB6bA67ndhP16U7YLfooFThNlH0-Ydsi9oluoYpQfU1S6mXwm6AzuyHzh7QitLDyT4AH5f1enD2wzVpp0gwtLYmVEQKFPU1SzOXCqMgo=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Default buildroot config for rock64 uses mainline kernel with
> default arch's generic defconfig which is not tailored for rock64.
> It might be possible that you have some newer revision than mine,
> which is not fully supported in mainline kernel.

I think you must be right.  I just downloaded 2019.11rc and built a vanilla image with just "make rock64_defconfig && make" and I can't get anything out of the USB ports.

> Couple of things to consider:
>
> 1.  you might want to change kernel version to newest one, maybe
>     your board is better supported in newer kernel.
>
> 2.  you can try and use kernel from ayufan that is made for rock64
>     (forked from official rockchip kernel repo) which surely will have
>     drivers mainline won't. He used to very actively support rock64 in
>     the past, I don't know how about now - last commit is 3 months old
>     (https://github.com/ayufan-rock64/linux-kernel)

Thanks for the info and advice.  It's appreciated.
