From: Drew Fustini <drew@beagleboard.org>
Date: Fri, 7 May 2021 16:30:04 -0700
Subject: [Buildroot] [PATCH v3 5/7] boot/beaglev-ddrinit: new package
In-Reply-To: <20210507220401.GE2137340@scaer>
References: <20210504205139.1055360-1-thomas.petazzoni@bootlin.com>
 <20210504205139.1055360-6-thomas.petazzoni@bootlin.com>
 <20210507220401.GE2137340@scaer>
Message-ID: <CAPgEAj6=TkK79B32P-JRL+T1KPYQd1djsVbYc2ah3zx7xno6cg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 7, 2021, 15:04 Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> On 2021-05-04 22:51 +0200, Thomas Petazzoni spake thusly:
> > This commit adds a package for the DDR initialization code used on the
> > BeagleV platform.
>
> The upstream package name is beaglev-ddrlnit, yes, with an 'l' instead
> of an 'i'. I've renamed the package to match upstream name, so that
> users that look for it can actually find it.
>
> Applied to master, thanks.
>
> Regards,
> Yann E. MORIN.


Would it be helpful if I get StarFive to fix the typo and rename it to
ddrinit?

 I am thinking that would probably be good to have happen before other
projects start pointing to it.  Thomas was so fast with the buildroot
patches I think it is the first to notice this.

Thank you,
Drew

>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210507/84b66ae4/attachment.html>
