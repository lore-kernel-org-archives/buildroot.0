From: Carlos Santos <unixmania@gmail.com>
Date: Fri, 8 Nov 2019 20:11:14 -0300
Subject: [Buildroot] [PATCH 2/2] configs/beaglebone: use the new
 BeagleBoard/BeagleBone kernel repository
In-Reply-To: <20191108221256.089bfa50@windsurf>
References: <20191102223839.16262-1-unixmania@gmail.com>
 <20191102223839.16262-3-unixmania@gmail.com>
 <20191108221256.089bfa50@windsurf>
Message-ID: <CAJ4jsaeuA66DLtkH8dLpJQpimSwjd5w5ntOZh2+9o7O1zvGOTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 8, 2019 at 6:12 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> +Peter, who contributed the beagleboneai defconfig.
>
> On Sat,  2 Nov 2019 19:38:39 -0300
> unixmania at gmail.com wrote:
>
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > The original source URL (http://beagleboard.org/source) now redirects to
> > https://elinux.org/Beagleboard:BeagleBoneBlack_Rebuilding_Software_Image
> > which points to an official kernel repository at GitHub.
> >
> > There are updated RT and non-RT kernel source trees. Use the last non-RT
> > release (4.19.73-ti-r29) and the omap2plus defconfig.
> >
> > Signed-off-by: Carlos Santos <unixmania@gmail.com>
>
> I've applied to next... but after doing, I realized that you could have
> used the github macro, like we do in beagleboneai_defconfig. Could you
> send a patch for that ?

I kept using git download method but I can replace it by the download
or the tarbal from GitHub.

> Also, it would be nice if we could align beagleboneai, beaglebone and
> beaglebone_qt5 to use the same U-Boot/Linux versions, if possible. I
> see that the beagleboneai is using 4.14 even though it's a much newer
> platform than beaglebone.

I have been working on it but did not have much free time in the last
weeks. I will try to fix it on time for 2019.11.

-- 
Carlos Santos <unixmania@gmail.com>
