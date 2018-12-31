From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 13:36:26 +0100
Subject: [Buildroot] [PATCH 2/2] atk: bump to version 2.30.0
In-Reply-To: <20181203073043.21021-2-fontaine.fabrice@gmail.com>
References: <20181203073043.21021-1-fontaine.fabrice@gmail.com>
 <20181203073043.21021-2-fontaine.fabrice@gmail.com>
Message-ID: <20181231133626.757b9dbb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Dec 2018 08:30:43 +0100, Fabrice Fontaine wrote:
> - Switch to meson-package
> - Remove ATK_INSTALL_STAGING_OPTS and host-pkgconf: not needed anymore
> - Add hash for license file
> - This bump fix the issue with glib 2.58.1 (because meson does not use
>   pkgconfig to find glib-genmarshal):
>   /bin/bash: /usr/bin/glib-genmarshal: No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/23cf5227c21365cda0babf1922425f8adaa97fba
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/atk/atk.hash | 7 +++++--
>  package/atk/atk.mk   | 9 ++++-----
>  2 files changed, 9 insertions(+), 7 deletions(-)

I've adjust the commit log, because it no longer fixes any build
failure, and I've applied to master. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
