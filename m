From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Apr 2021 23:08:40 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/postgis: new package
In-Reply-To: <20210408062830.1277591-1-fido_max@inbox.ru>
References: <20210408062830.1277591-1-fido_max@inbox.ru>
Message-ID: <8859ca90-1dce-778f-c883-8bae4291a03b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/04/2021 08:28, Maxim Kochetkov via buildroot wrote:
> PostGIS is a spatial database extender for PostgreSQL object-relational database.
> It adds support for geographic objects allowing location queries to be run in SQL.
> 
> https://postgis.net/
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>

 Applied to master, thanks, but still with a number of modifications:

     - Move postgresql dependency to package/Config.in, to satisfy
       alphabetical ordering in the menu while keeping it below postgresql.
     - Add dependency on !microblaze.
     - Add comment for dependencies.
     - Add positive version of --with-raster and --with-protobuf to
       _CONF_OPTS.
     - Expand BSD to BSD-2-Clause.


 Regards,
 Arnout
