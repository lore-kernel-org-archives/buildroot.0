From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Sep 2019 10:33:58 +0200
Subject: [Buildroot] [PATCH] package/pciutils: bump to version 3.6.2
In-Reply-To: <20190830184034.26771-2-chrismcc@gmail.com>
References: <20190830184034.26771-1-chrismcc@gmail.com>
 <20190830184034.26771-2-chrismcc@gmail.com>
Message-ID: <CACXmViYpB-Uyc0baOSN6O2yTGPy6uggC2eotKsxuvxp9LCdvtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 30, 2019 at 8:41 PM Christopher McCrory <chrismcc@gmail.com> wrote:
>
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  package/pciutils/pciutils.hash | 4 ++--
>  package/pciutils/pciutils.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
> index da0358cacd..2393643e53 100644
> --- a/package/pciutils/pciutils.hash
> +++ b/package/pciutils/pciutils.hash
> @@ -1,3 +1,3 @@
>  # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
> -sha256 1d62f8fa192f90e61c35a6fc15ff3cb9a7a792f782407acc42ef67817c5939f5        pciutils-3.5.5.tar.xz
> -sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6        COPYING
> +sha256 db452ec986edefd88af0d222d22f6102f8030a8633fdfe846c3ae4bde9bb93f3 pciutils-3.6.2.tar.xz
> +sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6 COPYING

A silent change to the license file is no good. Please describe what
changed in the file (and update the license details if needed).

-- 
Bye, Peter Korsgaard
