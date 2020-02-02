From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Feb 2020 09:05:27 +0100
Subject: [Buildroot] [PATCH 1/2] package/libnss: rename patch number
In-Reply-To: <20200124195704.115545-1-giulio.benetti@benettiengineering.com>
References: <20200124195704.115545-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200202090527.626045d4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Jan 2020 20:57:03 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> At the moment there are 2 patches with the same id(0001-xxx.patch) so
> let's rename one of them to 0002-xxx.patch.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...> 0002-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch} | 0  
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename package/libnss/{0001-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch => 0002-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch} (100%)

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
