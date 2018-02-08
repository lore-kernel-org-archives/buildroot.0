From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 23:05:00 +0100
Subject: [Buildroot] [PATCH] dnsmasq: add upstream security fix patches
In-Reply-To: <34e581a92b9ce8e77b00a06e06088506bd1e9fab.1518117395.git.baruch@tkos.co.il>
References: <34e581a92b9ce8e77b00a06e06088506bd1e9fab.1518117395.git.baruch@tkos.co.il>
Message-ID: <20180208230500.7db02bc4@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Feb 2018 21:16:35 +0200, Baruch Siach wrote:
> Fixes CVE-2017-15107: An attacker can craft an NSEC which wrongly proves
> non-existence.
> 
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...for-wildcard-NSEC-records.-CVE-2017-15107.patch | 212 +++++++++++++++++++++
>  ...validation-errors-introduced-in-4fe6744a2.patch |  29 +++
>  2 files changed, 241 insertions(+)
>  create mode 100644 package/dnsmasq/0001-DNSSEC-fix-for-wildcard-NSEC-records.-CVE-2017-15107.patch
>  create mode 100644 package/dnsmasq/0002-Fix-DNSSEC-validation-errors-introduced-in-4fe6744a2.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
