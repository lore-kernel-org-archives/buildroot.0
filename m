From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 21:39:34 +0200
Subject: [Buildroot] [PATCH] libuv: bump to version 1.9.0
In-Reply-To: <1460404971-29952-1-git-send-email-joerg.krause@embedded.rocks>
References: <1460404971-29952-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160413213934.0e32717c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Apr 2016 22:02:51 +0200, J?rg Krause wrote:
> Remove uClibc-ng patch applied upstream [1].
> 
> [1] https://github.com/libuv/libuv/commit/c8619721404c2a9f97adc34a8c3b5336317311bc
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  .../0001-unix-fix-support-for-uClibc-ng.patch      | 30 ----------------------
>  package/libuv/libuv.hash                           |  2 +-
>  package/libuv/libuv.mk                             |  2 +-
>  3 files changed, 2 insertions(+), 32 deletions(-)
>  delete mode 100644 package/libuv/0001-unix-fix-support-for-uClibc-ng.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
