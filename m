From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 21:15:31 +0200
Subject: [Buildroot] Buildroot ts4800_defconfig no longer builds
In-Reply-To: <20190919123832.GD7701@t480s.localdomain>
References: <20190810105411.42aa7518@windsurf.home>
 <20190919123832.GD7701@t480s.localdomain>
Message-ID: <20190919211531.5a4568e5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vivien,

On Thu, 19 Sep 2019 12:38:32 -0400
Vivien Didelot <vivien.didelot@gmail.com> wrote:

> > Also, could you send a patch adding yourself as a maintainer for this
> > defconfig in our DEVELOPERS file ?  
> 
> I'm updating Patrick's email and copying Damien as well, as he might be
> aware of this build issue.

For the record, we dropped the ts4800_defconfig before the 2019.08
release:

  https://git.buildroot.org/buildroot/commit/configs?id=bc395142b907b98e831208733afb0e19af8d2226

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
