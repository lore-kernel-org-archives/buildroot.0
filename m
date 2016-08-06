From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Aug 2016 21:56:48 +0200
Subject: [Buildroot] [PATCH] libpjsip: fix m68k uclinux compile
In-Reply-To: <1470489948-23258-1-git-send-email-luca@lucaceresoli.net>
References: <1470489948-23258-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20160806215648.67ed643b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Aug 2016 15:25:48 +0200, Luca Ceresoli wrote:

> +LIBPJSIP_CFLAGS=$(TARGET_CFLAGS) -DPJ_HAS_IPV6=1

One space before and after the = sign.

Committed with this minor typo fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
