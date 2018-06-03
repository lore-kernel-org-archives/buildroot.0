From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 Jun 2018 20:30:42 +0200
Subject: [Buildroot] [PATCH 1/1] librtas: bump to version 2.0.1
In-Reply-To: <20180602144315.32208-1-fontaine.fabrice@gmail.com>
References: <20180602144315.32208-1-fontaine.fabrice@gmail.com>
Message-ID: <20180603203042.6ceec751@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jun 2018 16:43:15 +0200, Fabrice Fontaine wrote:
> - Switch site to github
> - Move to autotools infrastructure
> - Remove patch (not needed anymore)
> - Since version 1.4 (January 2016), license is now LGPL-2.1+
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0001-librtas-install-librtas.so.1-symlink.patch | 31 ----------------------
>  package/librtas/librtas.hash                       |  3 ++-
>  package/librtas/librtas.mk                         | 24 +++++------------
>  3 files changed, 9 insertions(+), 49 deletions(-)
>  delete mode 100644 package/librtas/0001-librtas-install-librtas.so.1-symlink.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
