From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:30:18 +0200
Subject: [Buildroot] [PATCH 1/5] package/python-couchdb: new package
In-Reply-To: <20161006044858.27768-1-bernd.kuhls@t-online.de>
References: <20161006044858.27768-1-bernd.kuhls@t-online.de>
Message-ID: <20161007153018.7f76d26b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Oct 2016 06:48:54 +0200, Bernd Kuhls wrote:

> diff --git a/package/python-couchdb/Config.in b/package/python-couchdb/Config.in
> new file mode 100644
> index 0000000..5b1937f
> --- /dev/null
> +++ b/package/python-couchdb/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_COUCHDB
> +	bool "python-couchdb"

No runtime dependencies?

> +PYTHON_COUCHDB_VERSION = 1.1
> +PYTHON_COUCHDB_SOURCE = CouchDB-$(PYTHON_COUCHDB_VERSION).tar.gz
> +PYTHON_COUCHDB_SITE = https://pypi.python.org/packages/9a/e8/c3c8da6d00145aaca07f2b784794917613dad26532068da4e8392dc48d7f
> +PYTHON_COUCHDB_SETUP_TYPE = setuptools
> +PYTHON_COUCHDB_LICENSE = BSD

This is not a correct license. It should be BSD-2c, BSD-3c, or another
BSD variant.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
