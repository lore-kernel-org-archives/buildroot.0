From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Aug 2018 19:45:07 +0200
Subject: [Buildroot] [PATCH 1/1] ccache: bump to version 3.4.2
In-Reply-To: <20180825154737.18531-1-asafka7@gmail.com>
References: <20180825154737.18531-1-asafka7@gmail.com>
Message-ID: <20180825194507.41e813a0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Aug 2018 18:47:37 +0300, Asaf Kahlon wrote:
> Update license info, and remove the patch since it's already on upstream.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  ...t-to-sysroot-option-to-relative-path.patch | 43 -------------------
>  package/ccache/ccache.hash                    |  7 +--
>  package/ccache/ccache.mk                      |  8 ++--
>  3 files changed, 8 insertions(+), 50 deletions(-)
>  delete mode 100644 package/ccache/0001-Convert-argument-to-sysroot-option-to-relative-path.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
