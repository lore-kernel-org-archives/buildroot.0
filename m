From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Sep 2014 22:06:26 +0200
Subject: [Buildroot] [PATCH] parted not building static
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C68C8AD59C@ex-mb3.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C68C8AD59C@ex-mb3.corp.adtran.com>
Message-ID: <20140908220626.11ab93d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear ANDY KENNEDY,

On Mon, 8 Sep 2014 15:46:55 +0000, ANDY KENNEDY wrote:

> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +PARTED_CONF_OPT += --disable-dynamic-loading
> +endif

Your Buildroot tree is probably not up-to-date because this has already
been fixed by Gustavo in commit
ea7061f40e04f6a475705a579529978de1b9cc91 (June 2014). This commit is
part of the 2014.08 release.

Thanks for your patch!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
