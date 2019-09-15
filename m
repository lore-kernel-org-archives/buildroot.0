From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 15:36:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/paho-c-mqtt: bump to version
 1.3.1
In-Reply-To: <20190909083531.31343-1-julien.grossholtz@openest.io>
References: <20190909083531.31343-1-julien.grossholtz@openest.io>
Message-ID: <20190915153614.5051b180@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  9 Sep 2019 10:35:31 +0200
Julien Grossholtz <julien.grossholtz@openest.io> wrote:

> paho-mqtt-c 1.3.1 is the latest stable release. The latest release
> contains various bug fixes and adds TLS-PSK encryption support.
> 
> Release notes: https://github.com/eclipse/paho.mqtt.c/milestone/6?closed=1
> 
> Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
> ---
>  package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
>  package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. There was just a minor nit in the commit
title: the package is named paho-mqtt-c and not paho-c-mqtt. I fixed
that when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
