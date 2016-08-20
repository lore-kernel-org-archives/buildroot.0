From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 11:22:00 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-18
In-Reply-To: <57B8200F.8030305@imgtec.com>
References: <20160819063024.55AF4101904@stock.ovh.net>
 <20160820000709.0ceef3cd@free-electrons.com>
 <57B8200F.8030305@imgtec.com>
Message-ID: <20160820112200.102a666c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 14:47:03 +0530, Rahul Bedarkar wrote:

> > I guess
> > https://github.com/jackaudio/jack2/commit/ff1ed2c4524095055140370c1008a2d9cccc5645
> > should fix it.
> 
> Thanks. I have sent patch to fix this issue. 
> https://patchwork.ozlabs.org/patch/661117/

Great, thanks!

> > tsp_tcsi_param.c:14:28: fatal error: bits/local_lim.h: No such file or directory
> >   #include <bits/local_lim.h>
> >
> > No?, since you added this package, could you have a look?
> >  
> 
> I have fixed similar issue for mtd package and can take a look. 
> https://git.buildroot.net/buildroot/commit/?id=850e74c3639733986ff40b96fbca7d355aee738c

That would be nice, thanks!

Also, did you see the MIPS related issues on the qt5webkit package I
pointed in my latest analysis of build issues? Since you're working for
imgtec, I thought you might have some MIPS knowledge :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
