From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Dec 2017 09:04:50 +0100
Subject: [Buildroot] [PATCH v5 00/11] board: Add Allwinner A64/H5 boards
In-Reply-To: <CAMty3ZDHvYQsnR4gJhZ2XWPdcexZ0DV_f36pEW9Z7d9kcufLug@mail.gmail.com>
References: <1509559553-26544-1-git-send-email-jagan@amarulasolutions.com>
 <20171203225110.319cc00e@windsurf.home>
 <CAMty3ZDHvYQsnR4gJhZ2XWPdcexZ0DV_f36pEW9Z7d9kcufLug@mail.gmail.com>
Message-ID: <20171204090450.04fa4466@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Dec 2017 10:13:39 +0530, Jagan Teki wrote:

> > Since I was not super happy with this proposal to solve the ATF/U-Boot
> > building problem for Allwinner A64/H5, I just submitted a different
> > patch series (which re-uses some of your work, authorship preserved).
> > Could you see what you think about my proposal ?  
> 
> Yes, this is what I proposed in previous versions[1], unfortunately ie
> not moving further. Happy that now it has better shape to move.

It is not trivial to solve this problem in a nice and pretty fashion,
especially due to the ATF->U-Boot and U-Boot->ATF possible dependencies.

So my proposal is a proposal I find better, but I don't pretend it's
the perfection either.

> > If my proposal gets merged, then it would be nice if you could rebase
> > your defconfig patches on top of it. It's mainly a matter of adding a
> > few more ATF options and tweaking U-Boot options.  
> 
> Yes, will do.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
