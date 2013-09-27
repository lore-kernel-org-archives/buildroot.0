From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 27 Sep 2013 12:02:25 +0200
Subject: [Buildroot] [PATCH] configs: add Freescale i.MX 6SoloLite EVK
	support
In-Reply-To: <CAKcgs2wLPOTpRqu5Xe_1LkuuZwCcuAfHOSfS+Hy+gvpbS_Vk3g@mail.gmail.com>
 (Gilles Talis's message of "Fri, 27 Sep 2013 11:03:20 +0200")
References: <1380185523-26736-1-git-send-email-gilles.talis@gmail.com>
 <87fvsr5q7z.fsf@dell.be.48ers.dk>
 <CAKcgs2wLPOTpRqu5Xe_1LkuuZwCcuAfHOSfS+Hy+gvpbS_Vk3g@mail.gmail.com>
Message-ID: <87ioxm4m6m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> Peter,
 Gilles> +BR2_ROOTFS_DEVICE_CREATION_STATIC=y
 >> 
 >> Why do you want static device nodes?

 Gilles> Kernel defconfig does not support DEVTMPFS. I did not want to change
 Gilles> that. Is it a problem?

It's not really a problem, no - Just quite uncommon. Do notice that
Buildroot automatically enables devtmpfs support in the kernel if
needed, so it should all just work.

-- 
Bye, Peter Korsgaard
