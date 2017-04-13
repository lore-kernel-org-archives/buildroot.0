From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 22:39:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/fmt: fix permissions
In-Reply-To: <20170409151751.17907-1-bernd.kuhls@t-online.de>
References: <20170409151751.17907-1-bernd.kuhls@t-online.de>
Message-ID: <20170413223956.0d46389b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Apr 2017 17:17:51 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/fmt/fmt.hash | 0
>  package/fmt/fmt.mk   | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  mode change 100755 => 100644 package/fmt/fmt.hash
>  mode change 100755 => 100644 package/fmt/fmt.mk

Applied to master, thanks. I almost missed this patch: it was only
permission changes, so patchwork was not tracking this patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
