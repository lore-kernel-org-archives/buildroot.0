From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 22:32:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpcap: security bump version
 to 1.9.1
In-Reply-To: <20191006123901.30798-1-bernd.kuhls@t-online.de>
References: <20191006123901.30798-1-bernd.kuhls@t-online.de>
Message-ID: <20191007223213.2e5ae817@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Oct 2019 14:39:01 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patch applied upstream.
> 
> Changelog: https://www.tcpdump.org/libpcap-changes.txt
> 
> Quoting changelog:
> "Five CVE-2019-15161, CVE-2019-15162, CVE-2019-15163, CVE-2019-15164,
>  CVE-2019-15165
>  Fixes for CVE-2018-16301, errors in pcapng reading."
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...dd-missing-limits.h-for-musl-systems.patch | 26 -------------------
>  package/libpcap/libpcap.hash                  |  2 +-
>  package/libpcap/libpcap.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 28 deletions(-)
>  delete mode 100644 package/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-systems.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
