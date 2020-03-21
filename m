From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Mar 2020 17:05:06 +0100
Subject: [Buildroot] [PATCH v2 1/4] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.54
In-Reply-To: <20200316165253.560773-1-joerg.krause@embedded.rocks>
References: <20200316165253.560773-1-joerg.krause@embedded.rocks>
Message-ID: <20200321170506.294efea2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Mar 2020 17:52:50 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Changes since version 5.52:
> 
> 5.54:
>   Fix issue with HOGP to accept data only from bonded devices.
>   Fix issue with A2DP sessions being connected at the same time.
>   Fix issue with class UUID matches before connecting profile.
>   Add support for handling MTU auto-tuning option for AVDTP.
>   Add support for new policy for Just-Works repairing.
>   Add support for Enhanced ATT bearer (EATT).
> 
> 5.53:
>   Fix issue with handling unregistration for advertisment.
>   Fix issue with A2DP and handling recovering process.
>   Fix issue with udpating input device information.
>   Add support for loading blocked keys.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> v2:
>  * bump bluez5_utils-header, too [Baruch Siach]
> ---
>  package/bluez5_utils-headers/bluez5_utils-headers.mk | 2 +-
>  package/bluez5_utils/bluez5_utils.hash               | 2 +-
>  package/bluez5_utils/bluez5_utils.mk                 | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
