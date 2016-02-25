From: jerry at chordia.co.uk <jerry@chordia.co.uk>
Date: Thu, 25 Feb 2016 17:31:35 -0000
Subject: [Buildroot] How to include lsblk from linux-utils?
In-Reply-To: <20160225171433.7e200dfc@free-electrons.com>
References: <05f401d16fdf$4ddcc840$e99658c0$@chordia.co.uk>
 <20160225171433.7e200dfc@free-electrons.com>
Message-ID: <069601d16ff2$60263320$20729960$@chordia.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

> > Using BR 2016-02 how do I get lsblk installed?
> >
> > The source package is present but the utilities are not being built.
> > I've got System Tools >> install utilities selected but no lsblk is
visible.
> 
> You need to add a patch like the below to be able to select lsblk in your
build:
>

Excellent, that worked. Many thanks. Is this patch going into the next
release? 

BR,

Jerry.
