From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Apr 2018 17:47:35 +0200
Subject: [Buildroot] [PATCH 1/1] python-influxdb: new
In-Reply-To: <20180430102117.27271-1-sven.haardiek@iotec-gmbh.de>
References: <20180430102117.27271-1-sven.haardiek@iotec-gmbh.de>
Message-ID: <20180430174735.15bf267d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sven,

On Mon, 30 Apr 2018 12:21:17 +0200, Sven Haardiek wrote:
> InfluxDB client.
> 
> Signed-off-by: Sven Haardiek <sven.haardiek@iotec-gmbh.de>
> ---
>  package/Config.in                            |  1 +
>  package/python-influxdb/Config.in            | 10 ++++++++++
>  package/python-influxdb/python-influxdb.hash |  5 +++++
>  package/python-influxdb/python-influxdb.mk   | 14 ++++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/python-influxdb/Config.in
>  create mode 100644 package/python-influxdb/python-influxdb.hash
>  create mode 100644 package/python-influxdb/python-influxdb.mk

Applied to master after fixing the commit title, and adding an entry in
the DEVELOPERS file.

It is worth mentioning that you now have two separate entries in the
DEVELOPERS file, each with a different e-mail address. Maybe you want
to check this and see if having two different entries make sense, or if
they should be merged together.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
