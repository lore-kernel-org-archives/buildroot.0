From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 23:08:08 +0200
Subject: [Buildroot] [PATCH 2/2] package/libgpg-error: Fix compilation
 with gcc5
In-Reply-To: <1434301872-30351-2-git-send-email-bernd.kuhls@t-online.de>
References: <1434301872-30351-1-git-send-email-bernd.kuhls@t-online.de>
 <1434301872-30351-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150614230808.301b47c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 14 Jun 2015 19:11:12 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-avoid-breakage-with-gcc-5.patch           |   56 ++++++++++++++++++++
>  package/libgpg-error/libgpg-error.mk               |    3 ++
>  2 files changed, 59 insertions(+)
>  create mode 100644 package/libgpg-error/0001-avoid-breakage-with-gcc-5.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
