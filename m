From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 23 Mar 2020 20:42:37 +0100
Subject: [Buildroot] [PATCH 1/2] package/libtirpc: fix build with gcc 10
In-Reply-To: <20200305090322.5b1e5fcc@windsurf>
References: <20200228173052.5128-1-petr.vorel@gmail.com>
 <20200305043708.GA2841817@x230> <20200305090322.5b1e5fcc@windsurf>
Message-ID: <20200323194237.GA30642@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> You can search the autobuilders for successful build results, filtering
> per config options. See http://autobuild.buildroot.net/search.php.

> For example:

>   http://autobuild.buildroot.net/index.php?status=OK&symbols%5BBR2_PACKAGE_LIBTIRPC%5D=y

> will search all successful builds that had BR2_PACKAGE_LIBTIRPC enabled.

Thanks! Not sure if it's just a slow net on my side, but search takes ages.
Not sure whether you still maintain this web service, but adding index on column
which stores symbols might help (suppose it uses database).

Kind regards,
Petr
