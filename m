From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 31 Jul 2012 11:30:54 +0300
Subject: [Buildroot] [PATCH] protobuf: add license information
In-Reply-To: <1343722559-10028-1-git-send-email-spdawson@gmail.com>
References: <1343722559-10028-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120731083054.GC9675@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

On Tue, Jul 31, 2012 at 09:15:59AM +0100, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  package/protobuf/protobuf.mk |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> index 6e49dd3..653e90e 100644
> --- a/package/protobuf/protobuf.mk
> +++ b/package/protobuf/protobuf.mk
> @@ -6,6 +6,8 @@
>  PROTOBUF_VERSION = 2.4.1
>  PROTOBUF_SOURCE = protobuf-$(PROTOBUF_VERSION).tar.gz
>  PROTOBUF_SITE = http://protobuf.googlecode.com/files/
> +PROTOBUF_LICENSE = PROPRIETARY

The text at https://code.google.com/p/protobuf/source/browse/trunk/COPYING.txt 
looks more like a 3-clause BSD licence (see 
http://en.wikipedia.org/wiki/BSD_licenses). Is this considered proprietary?

baruch

> +PROTOBUF_LICENSE_FILES = COPYING.txt
>  
>  # N.B. Need to use host protoc during cross compilation.
>  PROTOBUF_DEPENDENCIES = host-protobuf
> -- 
> 1.7.9.5

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
