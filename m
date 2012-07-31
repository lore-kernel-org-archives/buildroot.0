From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 31 Jul 2012 10:38:55 +0200
Subject: [Buildroot] [PATCH] protobuf: add license information
In-Reply-To: <1343722559-10028-1-git-send-email-spdawson@gmail.com>
References: <1343722559-10028-1-git-send-email-spdawson@gmail.com>
Message-ID: <5017999F.9050507@lucaceresoli.net>
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
>   package/protobuf/protobuf.mk |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> index 6e49dd3..653e90e 100644
> --- a/package/protobuf/protobuf.mk
> +++ b/package/protobuf/protobuf.mk
> @@ -6,6 +6,8 @@
>   PROTOBUF_VERSION = 2.4.1
>   PROTOBUF_SOURCE = protobuf-$(PROTOBUF_VERSION).tar.gz
>   PROTOBUF_SITE = http://protobuf.googlecode.com/files/
> +PROTOBUF_LICENSE = PROPRIETARY

Hey, protobuf is licensed under the BSD-3c license.

Luca
