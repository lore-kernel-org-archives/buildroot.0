From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 22:52:57 +0200
Subject: [Buildroot] [PATCH 2/3] package/xserver: commonalise dependency
 on libdrm
In-Reply-To: <4368a6cd5cf0f903bc2e0dd756b413b9ed8378ad.1437950027.git.yann.morin.1998@free.fr>
References: <cover.1437950027.git.yann.morin.1998@free.fr>
 <4368a6cd5cf0f903bc2e0dd756b413b9ed8378ad.1437950027.git.yann.morin.1998@free.fr>
Message-ID: <20150729225257.1dbe308d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 27 Jul 2015 00:35:11 +0200, Yann E. MORIN wrote:

> +XSERVER_XORG_SERVER_NEEDS_LIBDRM = y

Shouldn't we use an hidden Config.in boolean instead for this?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
