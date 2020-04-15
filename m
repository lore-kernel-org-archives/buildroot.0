From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 21:40:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-influxdb: bump to
 version 5.3.0
In-Reply-To: <20200414015549.21132-1-james.hilliard1@gmail.com>
References: <20200414015549.21132-1-james.hilliard1@gmail.com>
Message-ID: <20200415214038.240c08cd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Apr 2020 19:55:49 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> As of upstream commit 3a5e6219a2b62af076caa4f37fab9258165ec266 msgpack
> is now required.
> 
> License hash change is due to date update in upstream commit
> cf83d1d429ecebb093f6eaab773bd41c251530ca.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-influxdb/Config.in            | 1 +
>  package/python-influxdb/python-influxdb.hash | 6 +++---
>  package/python-influxdb/python-influxdb.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
