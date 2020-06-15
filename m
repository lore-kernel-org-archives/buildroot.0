From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 15 Jun 2020 20:19:58 +0300
Subject: [Buildroot] [PATCH 1/1] package/json-for-modern-cpp: bump to
 version 3.8.0
In-Reply-To: <20200614205859.608988-1-aduskett@gmail.com>
References: <20200614205859.608988-1-aduskett@gmail.com>
Message-ID: <CALFsTFXuprauK+G3VDOm0uZMj4HqXZGuUc4yLxWVdP7r3CAgwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Jun 14, 2020 at 11:59 PM <aduskett@gmail.com> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/json-for-modern-cpp/json-for-modern-cpp.hash | 4 ++--
>  package/json-for-modern-cpp/json-for-modern-cpp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
> index c67cd37558..cdd5338a1b 100644
> --- a/package/json-for-modern-cpp/json-for-modern-cpp.hash
> +++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256 249548f4867417d66ae46b338dfe0a2805f3323e81c9e9b83c89f3adbfde6f31        json-3.7.3.tar.gz
> -sha256 7400586ce89c6a2cc65f6ca46997da5d356a230673d3a211e040b783f23578a1        LICENSE.MIT
> +sha256  7d0edf65f2ac7390af5e5a0b323b31202a6c11d744a74b588dc30f5a8c9865ba  json-3.8.0.tar.gz
> +sha256  7400586ce89c6a2cc65f6ca46997da5d356a230673d3a211e040b783f23578a1  LICENSE.MIT

According to the official release page, the copyright year was bumped
on this release:
https://github.com/nlohmann/json/releases/tag/v3.8.0
So the hash of LICENSE.MIT should be updated too.

> diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
> index e6f1df96f6..afc900b7dd 100644
> --- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
> +++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -JSON_FOR_MODERN_CPP_VERSION = 3.7.3
> +JSON_FOR_MODERN_CPP_VERSION = 3.8.0
>  JSON_FOR_MODERN_CPP_SOURCE = json-$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
>  JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,v$(JSON_FOR_MODERN_CPP_VERSION))
>  JSON_FOR_MODERN_CPP_LICENSE = MIT
> --
> 2.26.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
Regards,
Asaf.
