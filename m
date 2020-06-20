From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 21:54:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: drop dynamic
 library dependency
In-Reply-To: <20200618203856.57694-1-fontaine.fabrice@gmail.com>
References: <20200618203856.57694-1-fontaine.fabrice@gmail.com>
Message-ID: <20200620215402.44426226@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Jun 2020 22:38:56 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> paho-mqtt-c can be built statically since version 1.3.3 and
> https://github.com/eclipse/paho.mqtt.c/commit/f1459fac2532658a04962ae0ab67b5c3dc92ad75
> 
> See https://github.com/eclipse/paho.mqtt.c/issues/848
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/janus-gateway/Config.in    |  5 ++---
>  package/paho-mqtt-c/Config.in      |  5 ++---
>  package/paho-mqtt-c/paho-mqtt-c.mk | 14 ++++++++++++++
>  3 files changed, 18 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
