From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 21:30:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/gerbera: bump to version 1.3.4
In-Reply-To: <20191117180753.7394-1-fontaine.fabrice@gmail.com>
References: <20191117180753.7394-1-fontaine.fabrice@gmail.com>
Message-ID: <20191118213040.67f3a637@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Nov 2019 19:07:53 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix build with libupnp 1.8.5 through
> https://github.com/gerbera/gerbera/commit/1476d7a90673a870091044fcc0307f5bcaeb24be
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e77839fad16caa5798cacb36a5a48b3dbb822ea6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gerbera/gerbera.hash | 2 +-
>  package/gerbera/gerbera.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Since it fixes a build issue in master, I applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
