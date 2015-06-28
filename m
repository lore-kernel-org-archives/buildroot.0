From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 14:30:31 +0200
Subject: [Buildroot] [PATCH 0/5 v2] core/pkg-kconfig: fix saving back
 the configuration (branch yem/pr8156)
In-Reply-To: <cover.1434213146.git.yann.morin.1998@free.fr>
References: <cover.1434213146.git.yann.morin.1998@free.fr>
Message-ID: <20150628143031.026461ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 13 Jun 2015 18:46:33 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (5):
>       core/pkg-kconfig: extract package before using kconfig fragments
>       core/pkg-kconfig: ensure kconfig base and fragment files exist
>       core/pkg-kconfig: move the kconfig fixups to a macro
>       core/pkg-kconfig: run the kconfig fixups after exiting configurators
>       core/pkg-kconfig: allow saving config to a non-existing custom config file

All applied, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
