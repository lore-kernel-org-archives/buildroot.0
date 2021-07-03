From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 22:58:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.1.2
In-Reply-To: <20210623043120.11900-1-fido_max@inbox.ru>
References: <20210623043120.11900-1-fido_max@inbox.ru>
Message-ID: <20210703225803.0431fa60@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Jun 2021 07:31:20 +0300
Maxim Kochetkov via buildroot <buildroot@busybox.net> wrote:

> PostGIS 3.1.2
> 2021/05/21
> 
>  * Bug Fixes
> 
>   - #4871, TopoGeometry::geometry cast returns NULL for empty
>            TopoGeometry objects (Sandro Santilli)
>   - #4826, postgis_tiger_geocoder Better answers when no zip is provided
>            (Regina Obe)
>   - #4817, handle more complex compound coordinate dystems (Paul Ramsey)
>   - #4842, Only do axis flips on CRS that have a "Lat" as the first column (Paul Ramsey)
>   - Support recent Proj versions that have removed pj_get_release (Paul Ramsey)
>   - #4835, Adjust tolerance for geodetic calculations (Paul Ramsey)
>   - #4840, Improper conversion of negative geographic azimuth to positive (Paul Ramsey)
>   - #4853, DBSCAN cluster not formed when recordset length equal to minPoints (Dan Baston)
>   - #4863, Update bboxes after scale/affine coordinate changes (Paul Ramsey)
>   - #4876, Fix raster issues related to PostgreSQL 14 tablefunc changes
>            (Paul Ramsey, Regina Obe)
>   - #4877, mingw64 PostGIS / PostgreSQL 14 compile (Regina Obe, Tom Lane)
>   - #4838, Update to support Tiger 2020 (Regina Obe)
>   - #4890, Change Proj cache lifetime to last as long as connection (Paul Ramsey)
>   - #4845, Add Pg14 build support (Paul Ramsey)
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/postgis/postgis.hash | 2 +-
>  package/postgis/postgis.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
