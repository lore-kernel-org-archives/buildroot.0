From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Jun 2018 22:51:35 +0200
Subject: [Buildroot] [RFC PATCH v4 6/9] llvm: bump to version 6.0.0
In-Reply-To: <20180614224820.27126-7-joseph.kogut@gmail.com>
References: <20180610205417.13963-1-joseph.kogut@gmail.com>
 <20180614224820.27126-1-joseph.kogut@gmail.com>
 <20180614224820.27126-7-joseph.kogut@gmail.com>
Message-ID: <20180615225135.12480ab0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jun 2018 15:48:17 -0700, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  ...type-in-ORC-readMem-client-interface.patch | 37 -------------------
>  package/llvm/llvm.hash                        |  2 +-
>  package/llvm/llvm.mk                          |  2 +-
>  3 files changed, 2 insertions(+), 39 deletions(-)
>  delete mode 100644 package/llvm/0001-Fix-return-type-in-ORC-readMem-client-interface.patch

Applied to master, with the Tested-by from Valentin. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
