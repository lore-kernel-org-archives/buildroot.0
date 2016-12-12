From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Dec 2016 22:35:02 +0100
Subject: [Buildroot] [PATCH] php: fix build for AArch64
In-Reply-To: <20161212045113.25961-1-ishitatsuyuki@gmail.com>
References: <20161212045113.25961-1-ishitatsuyuki@gmail.com>
Message-ID: <20161212223502.1a4bec27@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Dec 2016 13:51:13 +0900, ishitatsuyuki at gmail.com wrote:
> From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
> 
> Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
> ---
>  ...asm-constraints-in-aarch64-multiply-macro.patch | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 package/php/0008-fix-asm-constraints-in-aarch64-multiply-macro.patch

I've slightly improved the commit log (mentioned what is fixed
exactly), and added a reference to the upstream pull request. Applied
with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
