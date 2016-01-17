From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 17 Jan 2016 21:58:31 +0200
Subject: [Buildroot] [PATCH] imx-kobs: fix build for recent toolchains
In-Reply-To: <1453060408-12544-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1453060408-12544-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160117195831.GF10304@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Sun, Jan 17, 2016 at 08:53:28PM +0100, Gary Bisson wrote:
> Starting with Linux 4.4 headers, mtd-user.h isn't including stdint.h any
> more which breaks the build.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> Hi all,
> 
> This patch fixes the following error:
> http://autobuild.buildroot.net/results/05a/05a159c7f8382237d4c941b1bb6de7dad72708f3/

This text should be part of the commit log message above.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
