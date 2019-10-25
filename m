From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 16:43:15 +0200
Subject: [Buildroot] [PATCH 0/2 v2] toolchain: handle toolchains with
 SSP in libssp.so (branch yem/libssp)
In-Reply-To: <cover.1572010936.git.yann.morin.1998@free.fr>
References: <cover.1572010936.git.yann.morin.1998@free.fr>
Message-ID: <20191025164315.655ed0b8@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Oct 2019 15:42:39 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Yann Droneaud (2):
>       toolchain/external: copy libssp.so if SSP is enabled
>       packages/sox: unconditionaly disable custom SSP detection

Thanks, applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
