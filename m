From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 21:53:27 +0100
Subject: [Buildroot] [PATCH 10/16] imx-parser: bump to version 4.2.1
In-Reply-To: <20180103183842.10182-11-gary.bisson@boundarydevices.com>
References: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
 <20180103183842.10182-11-gary.bisson@boundarydevices.com>
Message-ID: <20180103215327.686439cf@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 Jan 2018 19:38:36 +0100, Gary Bisson wrote:

> +ifeq ($(BR2_aarch64),y)
> +IMX_PARSER_CONF_OPTS += --enable-armv8
> +endif

Same as what Baruch said for PATCH 09/16: imx-parser is only available
on ARM right now (depends on BR2_arm).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
