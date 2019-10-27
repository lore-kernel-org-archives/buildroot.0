From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 10:15:01 +0100
Subject: [Buildroot] [PATCH] package/glog: bump to version 0.4.0
In-Reply-To: <20191027090252.28853-1-gilles.talis@gmail.com>
References: <20191027090252.28853-1-gilles.talis@gmail.com>
Message-ID: <20191027101501.3b39ad7c@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 10:02:52 +0100
Gilles Talis <gilles.talis@gmail.com> wrote:

> Also fixed a build issue reported by test-pkg.
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
>  ...ts-some-tests-require-HAVE_STACKTRAC.patch | 39 +++++++++++++++++++
>  package/glog/glog.hash                        |  2 +-
>  package/glog/glog.mk                          |  5 ++-
>  3 files changed, 44 insertions(+), 2 deletions(-)
>  create mode 100644 package/glog/0001-symbolize_unitests-some-tests-require-HAVE_STACKTRAC.patch

You could have explained why autoreconf was now needed in the commit
log, so I've done that and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
