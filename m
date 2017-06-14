From: Guy Benyei <guybe@mellanox.com>
Date: Wed, 14 Jun 2017 07:48:21 +0000
Subject: [Buildroot] [PATCH] gcc: add option to build and install
	gcc's	libssp
Message-ID: <AM3PR05MB433F8CD5087964A86E0CECCC9C30@AM3PR05MB433.eurprd05.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> When double checking the result of compiling uClibc with
> BR2_TOOLCHAIN_BUILDROOT_USE_SSP, I've seen, that uClibc is actually binary-
> identical to the version built without BR2_TOOLCHAIN_BUILDROOT_USE_SSP. I
> find it strange, as actually there should be some additional functions and
> variables enabled in this case. Anyhow,  might be able to work with the uClibc
> support enabled by default.

Triple checking shows 8K addition to the uClibc shared object - which is around 3% of its original size. Still not too much for us, so I'll stick with the uClibc SSP support.

Thanks
       Guy
