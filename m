From: Matthew Weber <Matthew.Weber@collins.com>
Date: Tue, 27 Nov 2018 08:27:02 -0600
Subject: [Buildroot] [PATCH] tslib: update to 1.18
In-Reply-To: <20181127083714.13509-1-martink@posteo.de>
References: <20181127083714.13509-1-martink@posteo.de>
Message-ID: <CANQCQpZzXhoc5xBfhhchCYEukodr4UZsmguv8tNMuQNypKnFvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin,

On Tue, Nov 27, 2018 at 2:37 AM Martin Kepplinger <martink@posteo.de> wrote:
>
> For the curious, there's the changelog summary:
> https://github.com/kergoth/tslib/releases
>
> Signed-off-by: Martin Kepplinger <martink@posteo.de>
> ---
>  package/tslib/tslib.hash | 4 ++--
>  package/tslib/tslib.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
> index c5fc836d64..a758702e74 100644
> --- a/package/tslib/tslib.hash
> +++ b/package/tslib/tslib.hash
> @@ -1,5 +1,5 @@
> -# https://github.com/kergoth/tslib/releases/download/1.17/tslib-1.17.tar.xz.sha256
> -sha256  9fdd33e66976bf9cc799be33824ba66672f892826e9b22de12b14df15cb0fddc  tslib-1.17.tar.xz
> +# https://github.com/kergoth/tslib/releases/download/1.18/tslib-1.18.tar.xz.sha256
> +sha256  986cce6d8ed896c0eba68d78acd788c7860ffe8a2165a9f631954e7f2889958b  tslib-1.18.tar.xz
>
>  # Locally computed
>  sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  COPYING
> diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
> index bd5311b93b..f5c4cd7997 100644
> --- a/package/tslib/tslib.mk
> +++ b/package/tslib/tslib.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -TSLIB_VERSION = 1.17
> +TSLIB_VERSION = 1.18
>  TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
>  TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
>  TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)

TSLIB_LICENSE_FILES = COPYING

Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
