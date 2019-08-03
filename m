From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 10:52:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/gsettings-desktop-schemas: bump
 to version 3.33.1
In-Reply-To: <20190803073820.9600-1-fontaine.fabrice@gmail.com>
References: <20190803073820.9600-1-fontaine.fabrice@gmail.com>
Message-ID: <20190803105246.4c49c018@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  3 Aug 2019 09:38:20 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch to meson-package
> - Disable introspection (enabled by default)
> - Drop host-intltool (not needed anymore with meson)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../gsettings-desktop-schemas.hash                       | 7 +++++--
>  .../gsettings-desktop-schemas.mk                         | 9 +++++----
>  2 files changed, 10 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
