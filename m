From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 May 2016 22:50:12 +0200
Subject: [Buildroot] [PATCH] system: add comment about
	busybox-show-others
In-Reply-To: <1464381291-24985-1-git-send-email-yann.morin.1998@free.fr>
References: <1464381291-24985-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160527225012.2ed6e4e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 May 2016 22:34:51 +0200, Yann E. MORIN wrote:

>  config BR2_INIT_SYSV
>  	bool "systemV"
> +	# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS exists even when Busybox is not enabled
>  	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # sysvinit

Well, I don't really see the point. You can perfectly well have Busybox
enabled *and* systemV as your init system.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
