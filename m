From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 21:36:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: bump to version
 1.3.2
In-Reply-To: <20200421114849.855332-1-julien.grossholtz@openest.io>
References: <20200421114849.855332-1-julien.grossholtz@openest.io>
Message-ID: <20200421213641.7f695c6e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Apr 2020 13:48:49 +0200
Julien Grossholtz <julien.grossholtz@openest.io> wrote:

> paho-c-mqtt 1.3.2 is a maintenance release. It fixes many bugs
> including memory leaks and segmentation faults.
> 
> Release notes: https://github.com/eclipse/paho.mqtt.c/milestone/7?closed=1
> 
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
