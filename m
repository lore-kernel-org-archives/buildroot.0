From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:08:15 +0200
Subject: [Buildroot] [PATCH] package/collectd: bump to version 5.11.0
In-Reply-To: <20200409160014.18401-1-asafka7@gmail.com>
References: <20200409160014.18401-1-asafka7@gmail.com>
Message-ID: <20200411100815.4a791490@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  9 Apr 2020 19:00:09 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Drop patch (already on upstream).
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  ...-protobuf-util-time_util.h-detection.patch | 50 -------------------
>  package/collectd/collectd.hash                |  6 +--
>  package/collectd/collectd.mk                  |  4 +-
>  3 files changed, 5 insertions(+), 55 deletions(-)
>  delete mode 100644 package/collectd/0001-configure.ac-fix-protobuf-util-time_util.h-detection.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
