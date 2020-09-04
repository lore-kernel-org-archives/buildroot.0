From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 09:15:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/collectd: bump to version 5.12.0
In-Reply-To: <20200903221557.91239-1-asafka7@gmail.com>
References: <20200903221557.91239-1-asafka7@gmail.com>
Message-ID: <20200904091540.449540c7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  4 Sep 2020 01:15:55 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> And drop patch (already in version).
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  ...c-dpdk_telemetry.c-fix-build-on-musl.patch | 37 -------------------
>  package/collectd/collectd.hash                |  6 +--
>  package/collectd/collectd.mk                  |  2 +-
>  3 files changed, 4 insertions(+), 41 deletions(-)
>  delete mode 100644 package/collectd/0001-src-dpdk_telemetry.c-fix-build-on-musl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
