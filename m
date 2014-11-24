From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Nov 2014 22:06:08 +0100
Subject: [Buildroot] [PATCH 0/5] Misc autobuilder fixes
In-Reply-To: <1416764163-12826-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416764163-12826-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141124220608.6191a55c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Nov 2014 18:35:58 +0100, Thomas Petazzoni wrote:

> Thomas Petazzoni (5):
>   toolchain-external: fix C++ build issues with the Blackfin toolchain

Not applied yet, investigation still on-going.

>   mpdecimal: fix build on pure static library configurations
>   ushare: do not allow building in static lib situations
>   radvd: switch to new patch naming convention, use Git formatted
>     patches
>   radvd: add a patch to fix build failure on architectures without
>     sysctl()

Patches applied. On the ushare patch, I've fixed the too long line
pointed out by Yann.

Thanks Yann for having reviewed the patches!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
