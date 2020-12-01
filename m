From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Dec 2020 23:39:21 +0100
Subject: [Buildroot] [PATCH v2] configs/arm_foundationv8: bump to Linux
 5.9.11
In-Reply-To: <20201127144024.21604-1-vincent.stehle@laposte.net>
References: <20201126165831.6341-1-vincent.stehle@laposte.net>
 <20201127144024.21604-1-vincent.stehle@laposte.net>
Message-ID: <20201201233921.684da279@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 27 Nov 2020 15:40:24 +0100
Vincent Stehl? via buildroot <buildroot@busybox.net> wrote:

> - Bump to the latest kernel v5.9.11 and require openssl.
> - Switch to PSCI for bringing up the secondary CPUs.
> - Switch to GICv3.
> - Update the instruction in the readme.txt to use the latest FVP v8
>   Foundation Platform 11.12 build 38, and to start 4 cores in SMP.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
