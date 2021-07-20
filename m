From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 22:27:02 +0200
Subject: [Buildroot] [PATCH v1] package/rtl8812au-aircrack-ng: new
 package
In-Reply-To: <20210705191533.29763-1-ps.report@gmx.net>
References: <20210705191533.29763-1-ps.report@gmx.net>
Message-ID: <20210720222702.66a8604d@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon,  5 Jul 2021 21:15:33 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Add rtl8812au-aircrack-ng (alternative to rtl8821au), recommended
> e.g. for Alfa cards ([1]) and as opposed to rtl8821au does not crash
> in case of configured for IBSS mode and supports iw set freq command in
> monitor mode.
> 
> [1] https://docs.alfa.com.tw/Support/Linux/RTL8811AU
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  DEVELOPERS                                     |  1 +
>  package/Config.in                              |  1 +
>  package/rtl8812au-aircrack-ng/Config.in        | 10 ++++++++++
>  .../rtl8812au-aircrack-ng.hash                 |  3 +++
>  .../rtl8812au-aircrack-ng.mk                   | 18 ++++++++++++++++++
>  5 files changed, 33 insertions(+)
>  create mode 100644 package/rtl8812au-aircrack-ng/Config.in
>  create mode 100644 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
>  create mode 100644 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk

I find it very sad that we need an alternative driver for the same
device... I've applied, but it would be good to see if this package
could replace the existing rtl8821au package.

Also, I'm confused about the naming: rtl8812au vs. rtl8821au. Are they
for the same hardware ?

I wish there was more effort to push such drivers in the upstream
kernel...

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
