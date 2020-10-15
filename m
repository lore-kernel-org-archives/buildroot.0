From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 23:41:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/mrp: Add init script
In-Reply-To: <20200908182118.2612943-1-horatiu.vultur@microchip.com>
References: <20200908182118.2612943-1-horatiu.vultur@microchip.com>
Message-ID: <20201015234102.6004725c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 8 Sep 2020 20:21:18 +0200
Horatiu Vultur via buildroot <buildroot@busybox.net> wrote:

> Add init script and systemd unit for MRP because it is using a
> daemon.
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  package/mrp/S65mrp      | 55 +++++++++++++++++++++++++++++++++++++++++
>  package/mrp/mrp.mk      | 10 ++++++++
>  package/mrp/mrp.service | 10 ++++++++
>  3 files changed, 75 insertions(+)
>  create mode 100644 package/mrp/S65mrp
>  create mode 100644 package/mrp/mrp.service

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
