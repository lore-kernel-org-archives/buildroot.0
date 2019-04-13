From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Apr 2019 17:09:55 +0200
Subject: [Buildroot] [PATCH 1/1] linux: use host pkg-config when host
 libelf is set
In-Reply-To: <20190408184233.10697-1-stuart.summers@intel.com>
References: <20190405184712.5582-1-stuart.summers@intel.com>
 <20190408184233.10697-1-stuart.summers@intel.com>
Message-ID: <986122e4-8826-b9f5-bd3a-06ed36948770@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/04/2019 20:42, Stuart Summers wrote:
> A patch was added to the Linux kernel in 5.1.0-rc3 which
> adds a requirement that the host build environment include
> pkg-config. Add the correct host-pkgconf dependency and
> environment variables to ensure Linux picks up the correct
> libraries.
> 
> v2: Use LINUX_MAKE_ENV to pass PKG_CONFIG_* options (Thomas)
> v3: Add PKG_CONFIG_ALLOW_SYSTEM_{CFLAGS,LIBS} to kconfig
>     blacklist and move LINUX_MAKE_ENV initial assign in
>     linux.mk before DEP* assignments (Yann)
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>

 Applied to master with Yann's suggested changes to the commit message, thank.

 Regards,
 Arnout
