From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 22:59:43 +0200
Subject: [Buildroot] [PATCH v3 00/15] Drop non-largefile support
In-Reply-To: <1427749654-30153-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427749654-30153-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150401225943.15ba7e49@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 30 Mar 2015 18:07:19 -0300, Gustavo Zacarias wrote:

> Gustavo Zacarias (15):
>   toolchain/helpers: add check for mandatory uClibc options
>   toolchain/helpers: make LFS mandatory for uclibc toolchains
>   package/uclibc: default to Y for LARGEFILE
>   toolchain-common: default to Y for LARGEFILE
>   toolchain: remove LARGEFILE selects
>   package infra: drop non-lfs support
>   configs: drop largefile option
>   busybox: force lfs build
>   system: drop largefile depends
>   boot/gummiboot: drop largefile depends
>   packages: remove (non-)lfs dependencies and tweaks
>   docs/manual: remove references to largefile
>   packages: remove non-lfs enabler patches
>   package/uclibc: drop BR2_TOOLCHAIN_BUILDROOT_LARGEFILE
>   toolchain-common: drop BR2_LARGEFILE

Applied, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
