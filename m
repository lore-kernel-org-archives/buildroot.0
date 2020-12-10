From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Dec 2020 22:28:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: bump to version
 1.3.7
In-Reply-To: <20201208141341.3990069-1-julien.grossholtz@openest.io>
References: <20201208141341.3990069-1-julien.grossholtz@openest.io>
Message-ID: <20201210222810.1daf76ec@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  8 Dec 2020 15:13:41 +0100
Julien Grossholtz <julien.grossholtz@openest.io> wrote:

> Paho-mqtt-c maintainance release. It fixes some bugs including client
> times out and buffer overflow:
> 
> https://github.com/eclipse/paho.mqtt.c/milestone/9?closed=1
> Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
> ---
>  package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
>  package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
