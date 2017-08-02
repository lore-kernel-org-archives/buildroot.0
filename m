From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 22:53:13 +0200
Subject: [Buildroot] 2017.08-rc1 approaching
In-Reply-To: <trinity-bf99dbd3-4c07-4421-bd8b-2ebe2b06d098-1501654134602@3capp-mailcom-bs15>
References: <20170801233055.2488a4fc@windsurf.home>
 <trinity-bf99dbd3-4c07-4421-bd8b-2ebe2b06d098-1501654134602@3capp-mailcom-bs15>
Message-ID: <20170802225313.5cb66435@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 2 Aug 2017 08:08:54 +0200, daggs wrote:

> my I inquire what will be the status of the odroidc2 in this release?

The defconfig is still there, in configs/odroidc2_defconfig. And it
currently builds fine:
https://gitlab.com/buildroot.org/buildroot/-/jobs/25168668.

> it still depends on gcc 4.9.x, I'm working on a latest uboot support which will remove this limitation but I wasn't able to get it to work yet.
> in addition I lost the ability to test it as the board was dedicated to other urgent matter, I'm planning to order a new one now but it will take time arrive.

For now, we're keeping gcc 4.9 support around, so no problem for the
2017.08 release.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
