From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 16 Feb 2021 22:03:12 +0200
Subject: [Buildroot] [PATCH 2/2] package/wpewebkit: bump version to
 2.30.5
In-Reply-To: <20210216191651.23256-2-peter@korsgaard.com>
References: <20210216191651.23256-1-peter@korsgaard.com>
 <20210216191651.23256-2-peter@korsgaard.com>
Message-ID: <20210216220312.GD15967@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

?and let's approve this one as well.

On Tue, 16 Feb 2021 20:16:50 +0100 Peter Korsgaard <peter@korsgaard.com> wrote:
> Bugfix release, fixing a number of issues:
> 
> - Fix RunLoop objects leaked in worker threads.
> - Fix JavaScriptCore AArch64 LLInt build with JIT disabled.
> - Use Internet Explorer quirk for Google Docs.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Acked-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
>  package/wpewebkit/wpewebkit.hash | 8 ++++----
>  package/wpewebkit/wpewebkit.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
> index 42bd27f11d..df8ac547b0 100644
> --- a/package/wpewebkit/wpewebkit.hash
> +++ b/package/wpewebkit/wpewebkit.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/wpewebkit-2.30.4.tar.xz.sums
> -md5  d423a01ffb5be44e6ad59b2cfb9d6eb3  wpewebkit-2.30.4.tar.xz
> -sha1  2fdca7b888966ad2ed7d998bef52c9024dae063f  wpewebkit-2.30.4.tar.xz
> -sha256  1e521d85cf8cf344b9fd08eabad7a1d18a330fb7862a77eaf78d7d7b10d5f6ef  wpewebkit-2.30.4.tar.xz
> +# From https://wpewebkit.org/releases/wpewebkit-2.30.5.tar.xz.sums
> +md5  63a9a7b7f29862ec827a730ba6542e80  wpewebkit-2.30.5.tar.xz
> +sha1  33136493672882d56617007d7ce65268cb79bda7  wpewebkit-2.30.5.tar.xz
> +sha256  4b577f4f07c34bb5d453d62b7a41d9e937bd3a2827a92dcd6f47c35f27c8359a  wpewebkit-2.30.5.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index 91f137d96f..78f729f824 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WPEWEBKIT_VERSION = 2.30.4
> +WPEWEBKIT_VERSION = 2.30.5
>  WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
>  WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
>  WPEWEBKIT_INSTALL_STAGING = YES
> -- 
> 2.20.1
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210216/e8c47d62/attachment.asc>
