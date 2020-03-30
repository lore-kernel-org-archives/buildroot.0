From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Mar 2020 07:25:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/rygel: bump to version 0.38.3
In-Reply-To: <20200329220428.35062-1-fontaine.fabrice@gmail.com>
References: <20200329220428.35062-1-fontaine.fabrice@gmail.com>
Message-ID: <20200330072517.0158e84d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Mar 2020 00:04:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update indentation of hash file (two spaces)
> - Fix build with gssdp/gupnp 1.2 thanks to:
>   https://github.com/GNOME/rygel/commit/791b688d8ac3f8da4d162b1935871d16fe8e16fd
> 
> Fixes:
>  - No autobuilder failures yet
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rygel/rygel.hash | 8 ++++----
>  package/rygel/rygel.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
