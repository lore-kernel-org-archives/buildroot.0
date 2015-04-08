From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 22:46:16 +0200
Subject: [Buildroot] [PATCH] Fix typos in comment blocks
In-Reply-To: <1428454416-30252-1-git-send-email-yamada.masahiro@socionext.com>
References: <1428454416-30252-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <20150408224616.21280eea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Masahiro Yamada,

On Wed,  8 Apr 2015 09:53:36 +0900, Masahiro Yamada wrote:
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  Makefile                            | 2 +-
>  board/avnet/zedboard/readme.txt     | 4 ++--
>  boot/uboot/uboot.mk                 | 2 +-
>  linux/Config.in                     | 2 +-
>  package/Makefile.in                 | 2 +-
>  package/pkg-generic.mk              | 2 +-
>  support/download/check-hash         | 2 +-
>  support/scripts/gen-manual-lists.py | 2 +-
>  8 files changed, 9 insertions(+), 9 deletions(-)

Thanks, applied, after taking into account the review comments from
Arnout and making the corresponding changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
