From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 17:03:21 +0200
Subject: [Buildroot] [PATCH 1/2 v3] toolchain/external: do not accept
 distro-class toolchains
In-Reply-To: <ce03f650233efff77aabd4450a9e4b458f7108ea.1426604262.git.yann.morin.1998@free.fr>
References: <cover.1426604262.git.yann.morin.1998@free.fr>
 <ce03f650233efff77aabd4450a9e4b458f7108ea.1426604262.git.yann.morin.1998@free.fr>
Message-ID: <20150404170321.2f2b5881@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 17 Mar 2015 16:14:55 +0100, Yann E. MORIN wrote:

> +	with_sysroot=`$${__CROSS_CC} -v 2>&1 |sed -r -e '/.* --with-sysroot=([^[:space:]]+)[[:space:]].*/!d; s//\1/'`; \

I found this sed expression a bit complicated, but maybe there's no
other choice. So I've applied this.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
