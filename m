From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:07:35 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/swupdate: bump to version
 2021.04
In-Reply-To: <20210704120020.1711040-1-james.hilliard1@gmail.com>
References: <20210704120020.1711040-1-james.hilliard1@gmail.com>
Message-ID: <20210717100735.619522b3@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun,  4 Jul 2021 06:00:20 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add new optional dependencies.
> 
> Drop patches that are now upstream.
> 
> License update details
> 
> LICENSES/BSD-1-Clause.txt:
> https://github.com/sbabic/swupdate/commit/e419b06b497ee627b05cbc33d4b4df064137d0de
> 
> LICENSES/BSD-2-Clause.txt:
> https://github.com/sbabic/swupdate/commit/32c1f98eaca69e362be074197f84a59d994c0876
> 
> LICENSES/BSD-3-Clause.txt:
> https://github.com/sbabic/swupdate/commit/32c1f98eaca69e362be074197f84a59d994c0876
> 
> LICENSES/CC0-1.0.txt:
> https://github.com/sbabic/swupdate/commit/7c3630f572e6d00d7c51b7c4925494c7a822aef9
> 
> LICENSES/CC-BY-ND-4.0.txt:
> https://github.com/sbabic/swupdate/commit/b66db00c56f9960e9983e1a6d36eef4f151124a8
> 
> LICENSES/GPL-2.0-only.txt:
> https://github.com/sbabic/swupdate/commit/af2cc98b44cc6a066c0be4511406294e9113e4b1
> 
> LICENSES/GPL-2.0-or-later.txt:
> https://github.com/sbabic/swupdate/commit/11af069b85475f5bcaa094261259a6b40e363986
> 
> LICENSES/ISC.txt:
> https://github.com/sbabic/swupdate/commit/6500f1e89a097bd12d0ac42f6c7cc7ee284a6e17
> 
> LICENSES/LGPL-2.1-or-later.txt:
> https://github.com/sbabic/swupdate/commit/4ef88a9df89ddd445597ef49309563d29cb72607
> 
> LICENSES/LicenseRef-OpenSSL-Exception.txt:
> https://github.com/sbabic/swupdate/commit/2f513d117c5948ca9d950bbb82f05e8e38cbab50
> 
> LICENSES/MIT.txt:
> https://github.com/sbabic/swupdate/commit/c1bad02cb93ff9bc616029cd27318134d36cfacb
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - add new dependencies
> ---
>  ...rce-kernel-to-reread-partition-table.patch | 32 ------------
>  ...-Shellscript-stops-before-completing.patch | 52 -------------------
>  package/swupdate/swupdate.hash                | 17 ++++--
>  package/swupdate/swupdate.mk                  | 42 +++++++++++++--
>  4 files changed, 50 insertions(+), 93 deletions(-)
>  delete mode 100644 package/swupdate/0001-diskpart-force-kernel-to-reread-partition-table.patch
>  delete mode 100644 package/swupdate/0002-Shellscript-stops-before-completing.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
