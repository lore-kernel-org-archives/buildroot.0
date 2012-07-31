From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 31 Jul 2012 10:47:11 +0200
Subject: [Buildroot] [PATCH v2] protobuf: add license information
In-Reply-To: <1343723821-11642-1-git-send-email-spdawson@gmail.com>
References: <1343723821-11642-1-git-send-email-spdawson@gmail.com>
Message-ID: <50179B8F.1060702@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
>
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>   v2: As pointed out by Baruch Siach, the correct license is three-clause BSD,
>   and not "PROPRIETARY" as claimed by v1 of this patch.
>
>   package/protobuf/protobuf.mk |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> index 6e49dd3..5032d70 100644
> --- a/package/protobuf/protobuf.mk
> +++ b/package/protobuf/protobuf.mk
> @@ -6,6 +6,8 @@
>   PROTOBUF_VERSION = 2.4.1
>   PROTOBUF_SOURCE = protobuf-$(PROTOBUF_VERSION).tar.gz
>   PROTOBUF_SITE = http://protobuf.googlecode.com/files/
> +PROTOBUF_LICENSE = BSD-3c
> +PROTOBUF_LICENSE_FILES = COPYING.txt
>   
>   # N.B. Need to use host protoc during cross compilation.
>   PROTOBUF_DEPENDENCIES = host-protobuf

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Luca
