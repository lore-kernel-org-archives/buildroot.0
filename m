From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 22:06:01 +0100
Subject: [Buildroot] [PATCH] imx-kobs: fix build for recent toolchains
In-Reply-To: <1453060408-12544-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1453060408-12544-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160119220601.1a8ae3a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Sun, 17 Jan 2016 20:53:28 +0100, Gary Bisson wrote:
> Starting with Linux 4.4 headers, mtd-user.h isn't including stdint.h any
> more which breaks the build.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> Hi all,

Applied, with some minor changes:

    [Thomas:
     - fix minor typo in the patch description
     - add reference to the autobuilder failure, as suggested by Baruch.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
