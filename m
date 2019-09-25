From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Sep 2019 09:18:26 +0200
Subject: [Buildroot] [PATCH 0/5 v3] openrc: further itegration (branch
 yem/openrc)
In-Reply-To: <20190924215056.fzhyg7mqswfdadct@c-ml-p3510.redembedded.pl>
References: <cover.1564920849.git.yann.morin.1998@free.fr>
 <20190923231240.3690e2c4@windsurf>
 <20190924082158.tbxjx6pxvfjpuctm@c-ml-p3510.redembedded.pl>
 <20190924215056.fzhyg7mqswfdadct@c-ml-p3510.redembedded.pl>
Message-ID: <20190925091826.5ac104f8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michal,

On Tue, 24 Sep 2019 23:50:56 +0200
michal.lyszczek at bofc.pl wrote:

> It looks like openrc is starting `keymaps' service, which means
> BR2_TARGET_GENERIC_TERM_KEYMAP is enabled, but this config depends on
> BR2_INIT_OPENRC && BR2_PACKAGE_KBD, (related snipet):

I'm not sure which version of Buildroot you're looking at, but there is
no option named BR2_TARGET_GENERIC_TERM_KEYMAP in current Buildroot
master.

> keymaps service is disabled in package/openrc/openrc.mk

And there's no such code in openrc.mk in Buildroot master.

Perhaps you're looking at some local branch you have, with some patches
that are not in upstream Buildroot at this point ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
