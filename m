From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Apr 2017 10:24:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.80
In-Reply-To: <20170415062440.11827-1-bernd.kuhls@t-online.de>
References: <20170415062440.11827-1-bernd.kuhls@t-online.de>
Message-ID: <20170415102407.5778d46a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Apr 2017 08:24:40 +0200, Bernd Kuhls wrote:
> Removed AUTORECONF, forgotten in 2.4.77 bump:
> https://git.buildroot.net/buildroot/commit/package/libdrm?id=137407a7f9a29daf6312a261bd50cf1d6d9622da
> 
> Also removed host-xutil_util-macros which was only needed for
> autoreconf:
> https://git.buildroot.net/buildroot/commit/package/libdrm?id=3284e1e2b4984ac487e04d0d826a49351dc0fc38
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libdrm/libdrm.hash | 10 +++++-----
>  package/libdrm/libdrm.mk   |  9 ++-------
>  2 files changed, 7 insertions(+), 12 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
