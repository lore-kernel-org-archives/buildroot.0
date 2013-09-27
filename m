From: Gilles Talis <gilles.talis@gmail.com>
Date: Fri, 27 Sep 2013 11:03:20 +0200
Subject: [Buildroot] [PATCH] configs: add Freescale i.MX 6SoloLite EVK
	support
In-Reply-To: <87fvsr5q7z.fsf@dell.be.48ers.dk>
References: <1380185523-26736-1-git-send-email-gilles.talis@gmail.com>
 <87fvsr5q7z.fsf@dell.be.48ers.dk>
Message-ID: <CAKcgs2wLPOTpRqu5Xe_1LkuuZwCcuAfHOSfS+Hy+gvpbS_Vk3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

>  Gilles> +BR2_ROOTFS_DEVICE_CREATION_STATIC=y
>
> Why do you want static device nodes?
Kernel defconfig does not support DEVTMPFS. I did not want to change
that. Is it a problem?
