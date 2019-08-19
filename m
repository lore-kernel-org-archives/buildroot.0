From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Aug 2019 15:56:53 +0200
Subject: [Buildroot] [PATCH 1/1] configs: bump kernel for TS-7680
In-Reply-To: <20190818201353.14398-1-julien.grossholtz@openest.io>
References: <20190818201353.14398-1-julien.grossholtz@openest.io>
Message-ID: <20190819155653.31a6b081@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 18 Aug 2019 22:13:53 +0200
Julien Grossholtz <julien.grossholtz@openest.io> wrote:

> The TS-7680 defconfig does not build with gcc 8.x and 9.x because it
> uses an old 3.14 kernel. Technologic Systems, the board manufacturer
> recently released an updated 4.9 based kernel on a separate repository
> on github.
> 
> Bump the kernel release from 3.14.28 to 4.19.186 and update the linux
> defconfig name as requested in the TS-7680 documentation [1].
> 
> [1] https://wiki.embeddedarm.com/wiki/TS-7680#Linux_4.9.y
> 
> Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
> ---
>  board/technologic/ts7680/readme.txt | 3 +--
>  configs/ts7680_defconfig            | 6 +++---
>  2 files changed, 4 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
