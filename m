From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 24 May 2017 15:42:25 +0000
Subject: [Buildroot] [PATCH] Revert "libcdio: disable on ARC,
 triggers a toolchain bug"
In-Reply-To: <20170516073213.9321-1-abrodkin@synopsys.com>
References: <20170516073213.9321-1-abrodkin@synopsys.com>
Message-ID: <1495640543.2909.62.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 2017-05-16 at 10:32 +0300, Alexey Brodkin wrote:
> This reverts commit 459f7302df8cdc45aa0f7f2581ebb6f05fb6432a.
> 
> libcdio building is fixed for ARC in
> 2b360bd547f1 "gcc: arc-2017.03-rc2: Fix "unrecognized supposed constant" error"
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Any chance to get this merged before Buildroot release?

-Alexey
