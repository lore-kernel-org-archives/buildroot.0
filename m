From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 21:43:47 +0100
Subject: [Buildroot] [PATCH 1/2] package/libpciaccess: fix musl build
In-Reply-To: <1453648919-16172-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453648919-16172-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160126214347.6a425982@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 24 Jan 2016 16:21:58 +0100, Bernd Kuhls wrote:
> Also added note about upstream commit to patch 0001.
> 
> Fixes
> http://autobuild.buildroot.net/results/e86/e869e08779626ac578017e6b34a82adf156d12f8/
> http://autobuild.buildroot.net/results/0bf/0bf803654e7298d5cd0b31fc55b1babdcd2f8765/
> http://autobuild.buildroot.net/results/f5a/f5a516cf6c25af89000019b6789d5a003099cdff/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libpciaccess/0001-limits_h.patch |  4 ++--
>  package/libpciaccess/0002-musl-arm.patch | 20 ++++++++++++++++++++
>  2 files changed, 22 insertions(+), 2 deletions(-)
>  create mode 100644 package/libpciaccess/0002-musl-arm.patch

Applied, thanks. Please submit patch 0002 to the upstream project. It
is worth mentioning that your patch is identical to the one used by
Alpine Linux:
http://git.alpinelinux.org/cgit/aports/tree/main/libpciaccess/fix-arm.patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
