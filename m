From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Oct 2019 09:23:29 +0200
Subject: [Buildroot] [PATCH] package/tcpdump: security bump to version
 4.9.3
In-Reply-To: <75047dd06b33001f2594778e17992fb27012a4c1.1571123546.git.baruch@tkos.co.il>
References: <75047dd06b33001f2594778e17992fb27012a4c1.1571123546.git.baruch@tkos.co.il>
Message-ID: <20191015092329.065b8a31@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Oct 2019 10:12:26 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> CHANGES summary:
> 
>     Fix buffer overflow/overread vulnerabilities:
>       CVE-2017-16808 (AoE)
>       CVE-2018-14468 (FrameRelay)
>       CVE-2018-14469 (IKEv1)
>       CVE-2018-14470 (BABEL)
>       CVE-2018-14466 (AFS/RX)
>       CVE-2018-14461 (LDP)
>       CVE-2018-14462 (ICMP)
>       CVE-2018-14465 (RSVP)
>       CVE-2018-14881 (BGP)
>       CVE-2018-14464 (LMP)
>       CVE-2018-14463 (VRRP)
>       CVE-2018-14467 (BGP)
>       CVE-2018-10103 (SMB - partially fixed, but SMB printing disabled)
>       CVE-2018-10105 (SMB - too unreliably reproduced, SMB printing disabled)
>       CVE-2018-14880 (OSPF6)
>       CVE-2018-16451 (SMB)
>       CVE-2018-14882 (RPL)
>       CVE-2018-16227 (802.11)
>       CVE-2018-16229 (DCCP)
>       CVE-2018-16301 (was fixed in libpcap)
>       CVE-2018-16230 (BGP)
>       CVE-2018-16452 (SMB)
>       CVE-2018-16300 (BGP)
>       CVE-2018-16228 (HNCP)
>       CVE-2019-15166 (LMP)
>       CVE-2019-15167 (VRRP)
>     Fix for cmdline argument/local issues:
>       CVE-2018-14879 (tcpdump -V)
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/tcpdump/tcpdump.hash | 6 ++++--
>  package/tcpdump/tcpdump.mk   | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
