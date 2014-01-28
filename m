From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 23:22:29 +0100
Subject: [Buildroot] [PATCH 3/3] package/weston: bump to 1.4.0
In-Reply-To: <a7009e9d1e3e546472a44efe39059af6338e49d5.1390947201.git.yann.morin.1998@free.fr>
References: <cover.1390947201.git.yann.morin.1998@free.fr>
 <a7009e9d1e3e546472a44efe39059af6338e49d5.1390947201.git.yann.morin.1998@free.fr>
Message-ID: <20140128232229.72633460@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 28 Jan 2014 23:14:20 +0100, Yann E. MORIN wrote:
>  WESTON_CONF_OPT = \
> +	--with-dtddir=$(TARGET_DIR)/usr/share/wayland \

wayland is also installed in staging, so I believe it would make more
sense to point to the staging directory here, no?

Is this DTD stuff needed at runtime? If not, maybe it can be removed
from the target directory altogether?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
