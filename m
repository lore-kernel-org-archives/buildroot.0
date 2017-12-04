From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 4 Dec 2017 09:10:50 +0300
Subject: [Buildroot] [PATCH v3 0/4] Add support for MacchiatoBin board
In-Reply-To: <20171203225313.762c507c@windsurf.home>
References: <20171203181818.10087-1-geomatsi@gmail.com>
 <20171203225313.762c507c@windsurf.home>
Message-ID: <20171204061050.soif6cijxrsvhzbd@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> On Sun,  3 Dec 2017 21:18:14 +0300, Sergey Matyukevich wrote:
> 
> > Sergey Matyukevich (4):
> >   mv-ddr-marvell: new package
> >   binaries-marvell: new package
> >   atf: add support for Marvell Armada
> 
> Since these changes conflicted with changes proposed by Jagan Teki to
> support Allwinner A64/H5, and because I was not entirely happy with
> Jagan's proposal, I made a different proposal that solves both Jagan's
> use case and your use case. So I've taken those 3 patches and adapted
> them, fixing some issues along the way. Of course, I've preserved your
> authorship on the patches.
> 
> Could you check my proposal at
> http://lists.busybox.net/pipermail/buildroot/2017-December/208788.html ?
> 
> >   solidrun/macchiatobin: add new board
> 
> I have replied separately to this patch, which I have not taken in my
> patch series. If Jagan and you are happy with my patches, it would be
> nice if you could resubmit your defconfig on top of it (and after
> fixing the other comments I made).

Sure, I will take part in review of your ATF patchset. Then I will resubmit
MacchiatoBin support as soon as the common base for arm64 boards is settled.

Regards,
Sergey
