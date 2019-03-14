From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 21:57:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/aioblescan: new package
In-Reply-To: <20190313220253.26245-1-grzegorz@blach.pl>
References: <20190313220253.26245-1-grzegorz@blach.pl>
Message-ID: <20190314215739.20f2c72f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 13 Mar 2019 23:02:52 +0100
Grzegorz Blach <grzegorz@blach.pl> wrote:

> Python library to scan and decode advertised BLE info.
> Uses asyncio.
> 
> https://github.com/frawau/aioblescan
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  DEVELOPERS                                       |  1 +
>  package/Config.in                                |  1 +
>  package/python-aioblescan/Config.in              |  7 +++++++
>  package/python-aioblescan/python-aioblescan.hash |  5 +++++
>  package/python-aioblescan/python-aioblescan.mk   | 14 ++++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 package/python-aioblescan/Config.in
>  create mode 100644 package/python-aioblescan/python-aioblescan.hash
>  create mode 100644 package/python-aioblescan/python-aioblescan.mk

The commit title didn't match exactly the package name, so I fixed that
up. The rest looked good to me, so I've applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
