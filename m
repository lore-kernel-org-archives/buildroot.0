From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Nov 2018 22:08:10 +0100
Subject: [Buildroot] [PATCH] imx-uuc: bump revision to 79e9798e
In-Reply-To: <20181112094402.1815-1-gary.bisson@boundarydevices.com>
References: <20181112094402.1815-1-gary.bisson@boundarydevices.com>
Message-ID: <20181113220810.3f4c3cba@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gary,

On Mon, 12 Nov 2018 10:44:02 +0100, Gary Bisson wrote:
> Main changes:
> - fix build error by gcc 8.2

I know it is what the upstream commit says, but the makedev() issue has
nothing to do with gcc 8.2, but with glibc 2.28. I fixed up the commit
log on that aspect.

To be honest, I hesitated a bit because we normally don't take version
bumps in master at this point. However, this is a fairly small
and not that widely used package, the number of upstream changes is not
enormous, so I applied it to master. But I really hesitated with asking
for just a backport of the glibc 2.28 fix instead.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
