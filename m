From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 14:43:44 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: add nconfig to editors
In-Reply-To: <1429309882-6918-1-git-send-email-petr.vorel@gmail.com>
References: <1429309882-6918-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <20150418144344.1115b084@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Petr Vorel,

On Sat, 18 Apr 2015 00:31:22 +0200, Petr Vorel wrote:

>  BUSYBOX_KCONFIG_FILE = $(BUSYBOX_CONFIG_FILE)
> -BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
> +BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
>  BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)

Unless I'm missing something, Busybox does not support nconfig:

make[1]: Entering directory '/home/thomas/projets/buildroot/output/build/busybox-1.23.2'
make[2]: *** No rule to make target 'nconfig'. Arr?t.
Makefile:443: recipe for target 'nconfig' failed

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
