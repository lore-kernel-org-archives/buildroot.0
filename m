From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Oct 2019 01:05:35 +0200
Subject: [Buildroot] [RFC PATCH v2 08/30] package/llvm/clang: note about
 version bumping dep
In-Reply-To: <20191017152929.49153-9-michael.drake@codethink.co.uk>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
 <20191017152929.49153-9-michael.drake@codethink.co.uk>
Message-ID: <c8379236-ac3d-9f82-25ec-441477be4204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/10/2019 17:29, Michael Drake wrote:
> From: Matt Weber <matthew.weber@rockwellcollins.com>
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Acked-by: Romain Naour <romain.naour@smile.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>

 This and the following patch were already merged on August 1. Please base your
patches on master before sending them.

 Regards,
 Arnout

> ---
>  package/clang/clang.mk | 1 +
>  package/llvm/llvm.mk   | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/package/clang/clang.mk b/package/clang/clang.mk
> index 0cab1c7f89..07e7fced2a 100644
> --- a/package/clang/clang.mk
> +++ b/package/clang/clang.mk
> @@ -4,6 +4,7 @@
>  #
>  ################################################################################
>  
> +# LLVM and Clang should be version bumped together
>  CLANG_VERSION = 8.0.0
>  CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
>  CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> index e20c909175..aa70a85490 100644
> --- a/package/llvm/llvm.mk
> +++ b/package/llvm/llvm.mk
> @@ -4,6 +4,7 @@
>  #
>  ################################################################################
>  
> +# LLVM and Clang should be version bumped together
>  LLVM_VERSION = 8.0.0
>  LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
>  LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
> 
