From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 May 2017 15:58:10 +0200
Subject: [Buildroot] [PATCH] Revert "libcdio: disable on ARC,
 triggers a toolchain bug"
In-Reply-To: <20170516073213.9321-1-abrodkin@synopsys.com>
References: <20170516073213.9321-1-abrodkin@synopsys.com>
Message-ID: <20170525155810.30f17175@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 May 2017 10:32:13 +0300, Alexey Brodkin wrote:
> This reverts commit 459f7302df8cdc45aa0f7f2581ebb6f05fb6432a.
> 
> libcdio building is fixed for ARC in
> 2b360bd547f1 "gcc: arc-2017.03-rc2: Fix "unrecognized supposed constant" error"
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  package/libcdio/Config.in | 2 --
>  1 file changed, 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
