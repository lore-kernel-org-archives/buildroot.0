From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Oct 2017 21:04:33 +0200
Subject: [Buildroot] [PATCH v2 1/2] dnsmasq: security bump to version
 2.78
In-Reply-To: <9b9ffd72d158a792696b98b6612e4e66ee11892a.1506965906.git.baruch@tkos.co.il>
References: <9b9ffd72d158a792696b98b6612e4e66ee11892a.1506965906.git.baruch@tkos.co.il>
Message-ID: <20171002210433.7173827f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Oct 2017 20:38:25 +0300, Baruch Siach wrote:
> Supported Lua version is now 5.2.
> 
> Add licenses hash.
> 
> Fixes a number of security issues:
> 
> CVE-2017-13704 - Crash when DNS query exceeded 512 bytes (a regression
> in 2.77, so technically not fixed by this bump)
> 
> CVE-2017-14491 - Heap overflow in DNS code
> 
> CVE-2017-14492 - Heap overflow in IPv6 router advertisement code
> 
> CVE-2017-14493 - Stack overflow in DHCPv6 code
> 
> CVE-2017-14494 - Information leak in DHCPv6
> 
> CVE-2017-14496 - Invalid boundary checks allows a malicious DNS queries
> to trigger DoS
> 
> CVE-2017-14495 - Out-of-memory Dos vulnerability
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: Bump to 2.78
>     Note security fixes in the commit log
> ---
>  package/dnsmasq/dnsmasq.hash | 6 +++++-
>  package/dnsmasq/dnsmasq.mk   | 4 ++--
>  2 files changed, 7 insertions(+), 3 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
