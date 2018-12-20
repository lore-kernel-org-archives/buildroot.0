From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 20 Dec 2018 09:32:33 -0200
Subject: [Buildroot] Buildroot 2018.11.1 released
In-Reply-To: <20181220091656.40397ad9@windsurf>
References: <87k1k5upbc.fsf@dell.be.48ers.dk>
 <20181220091656.40397ad9@windsurf>
Message-ID: <CAOMZO5Cbf+dMGq8LOotYrqnkCoF9WJCLJ6hsama=BqBkb=LOJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Dec 20, 2018 at 6:17 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> Here is a quick analysis:
>
> imx6slevk_defconfig,
> https://gitlab.com/buildroot.org/buildroot/-/jobs/136980040
>
> freescale_imx7dsabresd_defconfig,
> https://gitlab.com/buildroot.org/buildroot/-/jobs/136980027
>
> Both of these look very similar to what was fixed by commit
> 1ad9c45a059deaaae65a78a9ed7f78b579fed422 in master, but this commit is
> also in 2018.11.x.
>
> However, commit 1ad9c45a059deaaae65a78a9ed7f78b579fed422 does not apply
> to the failing defconfigs, as they don't use the patch added in
> board/freescale/ by this commit.
>
> Fabio, could you perhaps have a look ?

Yes, I will submit patches to fix these issues.

Cheers
