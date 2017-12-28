From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 23:21:23 +0100
Subject: [Buildroot] [PATCH v4 1/2] meson: new package
In-Reply-To: <20171029131052.18850-2-eric.le.bihan.dev@free.fr>
References: <20171029131052.18850-1-eric.le.bihan.dev@free.fr>
 <20171029131052.18850-2-eric.le.bihan.dev@free.fr>
Message-ID: <20171228232123.66ee58c0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Oct 2017 14:10:51 +0100, Eric Le Bihan wrote:
> This new package provides the host variant of the Meson Build System, an
> open source build system meant to be both extremely fast, and as user
> friendly as possible.
> 
> More precisely, Meson creates configuration files for the Ninja build
> system.
> 
> Besides building Meson, it generates a configuration file
> ("$(HOST_DIR)/etc/meson/cross-compilation.conf") to be used when
> cross-compiling a Meson-based project.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/meson/cross-compilation.conf.in | 23 ++++++++++++++++++++++
>  package/meson/meson.hash                |  3 +++
>  package/meson/meson.mk                  | 35 +++++++++++++++++++++++++++++++++
>  3 files changed, 61 insertions(+)
>  create mode 100644 package/meson/cross-compilation.conf.in
>  create mode 100644 package/meson/meson.hash
>  create mode 100644 package/meson/meson.mk

Applied to master after adding an entry to the DEVELOPERS file. It
would be nice to quickly have a package that uses this, as right now
host-meson is not used anywhere.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
