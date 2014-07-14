From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jul 2014 16:33:25 +0200
Subject: [Buildroot] [PATCH 4 of 6] uclibc: rename SETUP_DOT_CONFIG to
 FIXUP_DOT_CONFIG
In-Reply-To: <1f15cd84996d1bb6fb3a.1405338628@localhost>
References: <patchbomb.1405338624@localhost>
 <1f15cd84996d1bb6fb3a.1405338628@localhost>
Message-ID: <20140714163325.231613e5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 14 Jul 2014 13:50:28 +0200, Thomas De Schampheleire wrote:

> -define UCLIBC_SETUP_DOT_CONFIG
> +define UCLIBC_FIXUP_DOT_CONFIG
>  	$(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(@D)/.config

This this variable is actually copying the configuration file, I
believe the current name of the variable is more correct than the one
you propose to use, no?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
