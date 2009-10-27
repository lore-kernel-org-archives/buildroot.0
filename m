From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Oct 2009 10:53:29 +0100
Subject: [Buildroot] [PATCH] Fix TARGET_PATH variable with external
 toolchain
In-Reply-To: <1256636707.32194.7.camel@coalu.atr>
References: <1256342684.28475.5.camel@coalu.atr>
	<87ljj0zlh6.fsf@macbook.be.48ers.dk> <20091027084428.6132b429@surf>
	<1256636707.32194.7.camel@coalu.atr>
Message-ID: <20091027105329.0cc61c47@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 27 Oct 2009 10:45:07 +0100,
Lionel Landwerlin <llandwerlin@gmail.com> a ?crit :

> Sounds right to me.
> 
> Let's add
> 
>  WEBKIT_CONF_ENV = icu_config=$(STAGING_DIR)/usr/bin/icu-config
> 
> to the webkit makefile.

Sure. But we'll have to remember that this is the solution to apply on
all similar packages... for some of which a xxx_config configure
options might not be present.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
