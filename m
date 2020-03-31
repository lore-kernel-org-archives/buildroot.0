From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Mar 2020 23:27:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/gupnp-tools: bump to version
 0.10.0
In-Reply-To: <20200330214913.1344862-1-fontaine.fabrice@gmail.com>
References: <20200330214913.1344862-1-fontaine.fabrice@gmail.com>
Message-ID: <20200331232741.3bbf34e3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Mar 2020 23:49:13 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update indentation of hash file (two spaces)
> - Fix build with latest gupnp/gssdp thanks to
>   https://gitlab.gnome.org/GNOME/gupnp-tools/-/commit/41feb3168d3870e0d017c248f20cbe85bc5acde7
> 
> Fixes:
>  - No autobuilder failures yet
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gupnp-tools/gupnp-tools.hash | 6 +++---
>  package/gupnp-tools/gupnp-tools.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
