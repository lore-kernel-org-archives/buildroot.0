From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 12:47:41 +0100
Subject: [Buildroot] [PATCH 10/11 v5] package/freerdp: install server
 key and certificate
In-Reply-To: <4bfcb4d735dcded5ba4328260a13970af1023c0b.1424558036.git.yann.morin.1998@free.fr>
References: <cover.1424558036.git.yann.morin.1998@free.fr>
 <4bfcb4d735dcded5ba4328260a13970af1023c0b.1424558036.git.yann.morin.1998@free.fr>
Message-ID: <20150222124741.2743fb7c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 21 Feb 2015 23:36:23 +0100, Yann E. MORIN wrote:

> +define FREERDP_INSTALL_KEYS
> +	$(INSTALL) -D $(@D)/server/X11/server.key \
> +		      $(TARGET_DIR)/etc/freerdp/keys/server.key
> +	$(INSTALL) -D $(@D)/server/X11/server.crt \
> +		      $(TARGET_DIR)/etc/freerdp/keys/server.crt

No explicit '-m' ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
