From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 15:37:10 +0200
Subject: [Buildroot] [PATCH v3 5/7] package/libodb-pgsql: new package
In-Reply-To: <20200706153040.427457-6-kamel.bouhara@bootlin.com>
References: <20200706153040.427457-1-kamel.bouhara@bootlin.com>
 <20200706153040.427457-6-kamel.bouhara@bootlin.com>
Message-ID: <20200712153710.712db92c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  6 Jul 2020 17:30:38 +0200
Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:

> From: Adam Duskett <aduskett@gmail.com>
> 
> This package contains the PostgreSQL ODB runtime library.
> Every application that includes code generated for the PostgreSQL
> database will need to link to this library.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> [Kamel: Fix incorrect license, Remove false dependency on host-odb]
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
>  DEVELOPERS                             |  1 +
>  package/Config.in                      |  1 +
>  package/libodb-pgsql/Config.in         | 16 ++++++++++++++++
>  package/libodb-pgsql/libodb-pgsql.hash |  6 ++++++
>  package/libodb-pgsql/libodb-pgsql.mk   | 16 ++++++++++++++++
>  5 files changed, 40 insertions(+)
>  create mode 100644 package/libodb-pgsql/Config.in
>  create mode 100644 package/libodb-pgsql/libodb-pgsql.hash
>  create mode 100644 package/libodb-pgsql/libodb-pgsql.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
