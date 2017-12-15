From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Dec 2017 09:00:31 +0100
Subject: [Buildroot] [PATCH] package/openpowerlink: bump to v2.6.2
In-Reply-To: <20171214220726.13262-1-romain.naour@gmail.com>
References: <20171214220726.13262-1-romain.naour@gmail.com>
Message-ID: <20171215090031.44167279@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Dec 2017 23:07:26 +0100, Romain Naour wrote:
> This is the latest release of the v2.6.x release series.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Corentin GUILLEVIC <corentin.guillevic@smile.fr>
> ---
> Note:
> Currently the openpowerlink kernel driver doesn't build	with
> a kernel >= 4.12 due API changes in the kernel.
> But it's not really a problem since it's highly recommended to
> use a preempt-rt kernel with openpowerlink.
> The latest preempt-rt kernel version is curently 4.9.65.
> ---
>  .../0004-use-contrib-getopt-only-on-Windows.patch  | 102 -------------
>  ...config-to-fix-static-linking-with-libpcap.patch | 166 ---------------------
>  package/openpowerlink/openpowerlink.hash           |   8 +-
>  package/openpowerlink/openpowerlink.mk             |   2 +-
>  4 files changed, 5 insertions(+), 273 deletions(-)
>  delete mode 100644 package/openpowerlink/0004-use-contrib-getopt-only-on-Windows.patch
>  delete mode 100644 package/openpowerlink/0005-use-pcap-config-to-fix-static-linking-with-libpcap.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
