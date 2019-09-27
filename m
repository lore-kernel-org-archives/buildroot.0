From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 23:49:50 +0200
Subject: [Buildroot] [PATCH 02/08] package/python-sqlparse: new package
In-Reply-To: <20190804011631.86261-3-aduskett@gmail.com>
References: <20190804011631.86261-1-aduskett@gmail.com>
 <20190804011631.86261-3-aduskett@gmail.com>
Message-ID: <20190927234950.4f27ec71@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  3 Aug 2019 21:16:25 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> sqlparse is a non-validating SQL parser for Python. It provides support for
> parsing, splitting and formatting SQL statements.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  DEVELOPERS                                   |  1 +
>  package/Config.in                            |  1 +
>  package/python-sqlparse/Config.in            |  8 ++++++++
>  package/python-sqlparse/python-sqlparse.hash |  5 +++++
>  package/python-sqlparse/python-sqlparse.mk   | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-sqlparse/Config.in
>  create mode 100644 package/python-sqlparse/python-sqlparse.hash
>  create mode 100644 package/python-sqlparse/python-sqlparse.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
