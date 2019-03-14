From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 21:24:39 +0100
Subject: [Buildroot] [PATCH 2/2] package/ulogd: bump to version 2.0.7
In-Reply-To: <20190313181512.2668-2-fontaine.fabrice@gmail.com>
References: <20190313181512.2668-1-fontaine.fabrice@gmail.com>
 <20190313181512.2668-2-fontaine.fabrice@gmail.com>
Message-ID: <20190314212439.114a3114@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 13 Mar 2019 19:15:12 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

>  - Remove three patches (already in version)
>  - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ev-null-as-dummy-logfile-when-logging-to-.patch |  70 --
>  ...fine-_GNU_SOURCE-to-get-members-of-tcphdr.patch |  44 --
>  .../ulogd/0003-Use-stdint-types-everywhere.patch   | 792 ---------------------
>  package/ulogd/ulogd.hash                           |  10 +-
>  package/ulogd/ulogd.mk                             |   2 +-
>  5 files changed, 8 insertions(+), 910 deletions(-)
>  delete mode 100644 package/ulogd/0001-ulogd-Use-dev-null-as-dummy-logfile-when-logging-to-.patch
>  delete mode 100644 package/ulogd/0002-Define-_GNU_SOURCE-to-get-members-of-tcphdr.patch
>  delete mode 100644 package/ulogd/0003-Use-stdint-types-everywhere.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
