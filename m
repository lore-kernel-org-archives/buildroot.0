From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 23:35:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/gvfs: needs dynamic library
In-Reply-To: <20200715195244.253915-1-fontaine.fabrice@gmail.com>
References: <20200715195244.253915-1-fontaine.fabrice@gmail.com>
Message-ID: <20200715233552.237246f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jul 2020 21:52:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Since commit 35e240105f1db3e91fb769616efd8bdb90fb1b24, gvfs needs
> dynamic library as it uses shared_module to build libgvfs_dbus and
> libgioremote_volume_monitor
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/89a02fda05e75bfc9bd4fa17fea3bec23fd5da3d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/docker-engine/Config.in | 1 +
>  package/gvfs/Config.in          | 6 ++++--
>  2 files changed, 5 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
