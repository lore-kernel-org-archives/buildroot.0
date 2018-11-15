From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 15 Nov 2018 17:32:55 +0100
Subject: [Buildroot] [PATCH 5/5] llvm/clang: add note about version
 bumping together
In-Reply-To: <1542150146-12188-5-git-send-email-matthew.weber@rockwellcollins.com>
References: <1542150146-12188-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1542150146-12188-5-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <c887f447-4f83-c9ec-9ae1-2d8a76f12ab0@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Le 14/11/2018 ? 00:02, Matt Weber a ?crit?:
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

This patch is not related to compiler-rt and can me merged as is.

Acked-by: Romain Naour <romain.naour@smile.fr>

Best regards,
Romain

> ---
>  package/clang/clang.mk | 1 +
>  package/llvm/llvm.mk   | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/package/clang/clang.mk b/package/clang/clang.mk
> index f9d4ae3..16f93ee 100644
> --- a/package/clang/clang.mk
> +++ b/package/clang/clang.mk
> @@ -4,6 +4,7 @@
>  #
>  ################################################################################
>  
> +# LLVM and Clang should be version bumped together
>  CLANG_VERSION = 7.0.0
>  CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
>  CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> index 79477f0..56f6ed9 100644
> --- a/package/llvm/llvm.mk
> +++ b/package/llvm/llvm.mk
> @@ -4,6 +4,7 @@
>  #
>  ################################################################################
>  
> +# LLVM and Clang should be version bumped together
>  LLVM_VERSION = 7.0.0
>  LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
>  LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
> 
