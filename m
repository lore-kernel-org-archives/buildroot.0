From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 28 Dec 2015 17:20:14 -0200
Subject: [Buildroot] Anybody with a Cubieboard2 ?
In-Reply-To: <20151228181051.48601453@free-electrons.com>
References: <20151228181051.48601453@free-electrons.com>
Message-ID: <CAK4VdL2dSgU-SG4eOAUUnwXCS8jcvb_AnRxYRw2SOfPc+jx0og@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Dec 28, 2015 at 3:10 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> If we have some users with a Cubieboard2, it would be really good if
> one of you could update the defconfig we have for the Cubieboard2,
> especially the version of U-Boot being used.
>
> The current version of U-Boot being used doesn't build properly for
> highly parallel builds, and therefore causes some build failures in our
> Travis continuous integration.
>
> If you have a Cubieboard2 and don't know how to help, just let me know,
> I can probably update the configuration, and give you the new images to
> be tested.
>

I have a cubieboard2 around and I can do the defconfig update.
I also noticed that archlinux arm has recently moved to upstream
kernel instead of sunxi kernel for the cubieboard2 release, so
apparently upstream support is now getting mature.
I'll test the upstream releases with buildroot and then submit an update.

Erico
