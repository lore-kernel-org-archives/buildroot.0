From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Apr 2018 08:59:56 +0200
Subject: [Buildroot] [PATCH] package/weston: Bump version to 4.0.0
In-Reply-To: <20180416162526.23094-1-abrodkin@synopsys.com>
References: <20180416162526.23094-1-abrodkin@synopsys.com>
Message-ID: <20180417085956.1e51ab5f@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Apr 2018 19:25:26 +0300, Alexey Brodkin wrote:
> Added all hashes provided by upstream.
> 
> Yann's patch was integrated in upstream, see:
> https://cgit.freedesktop.org/wayland/weston/commit/?id=fa41bdfbc
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0002-shared-struct-timespec-is-in-time.h.patch | 44 ----------------------
>  package/weston/weston.hash                         | 10 ++---
>  package/weston/weston.mk                           |  2 +-
>  3 files changed, 6 insertions(+), 50 deletions(-)
>  delete mode 100644 package/weston/0002-shared-struct-timespec-is-in-time.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
