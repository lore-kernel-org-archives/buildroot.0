From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 18 Nov 2018 19:53:07 -0200
Subject: [Buildroot] [PATCH v2 6/6] llvm/clang: add note about version
 bumping together
References: <1542426982-54683-6-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <5bf1df435c888_7ce43f955803c58c56625@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here again, the changes could be made while applying.
But please double-check, maybe I missed something.

On Sat, Nov 17, 2018 at 01:56 AM, Matt Weber wrote:

[snip]
> +++ b/package/clang/clang.mk
> @@ -4,6 +4,7 @@
>  #
>  ################################################################################
>  
> +# LLVM and Clang should be version bumped together

As I replied to patch 1, shouldn't compiler-rt be added to this list?

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

Same here.


Regards,
Ricardo
