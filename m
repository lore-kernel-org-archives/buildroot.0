From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 23:46:50 +0200
Subject: [Buildroot] [PATCH 0/4] core/pkg-kconfig: fix saving back the
 configuration (branch yem/pr8156)
In-Reply-To: <cover.1433591404.git.yann.morin.1998@free.fr>
References: <cover.1433591404.git.yann.morin.1998@free.fr>
Message-ID: <20150612234650.3ed22264@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat,  6 Jun 2015 13:54:22 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (4):
>       core/pkg-kconfig: ensure kconfig file and fragments exist
>       core/pkg-kconfig: move the kconfig fixups to a macro
>       core/pkg-kconfig: run the kconfig fixups after exiting configurators
>       core/pkg-kconfig: allow saving config to a non-existing custom config file

I've tested the series, and I confirm it fixes the problem for me.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
