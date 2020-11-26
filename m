From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Nov 2020 16:38:34 +0100
Subject: [Buildroot] [PATCH 07/10] support/scripts/cve-checker: show CPE
 ID in results
In-Reply-To: <20201104145145.1316167-8-thomas.petazzoni@bootlin.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-8-thomas.petazzoni@bootlin.com>
Message-ID: <20201126163834.296257b9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Nov 2020 15:51:41 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> From: Gregory CLEMENT <gregory.clement@bootlin.com>
> 
> This commit improves the cve-checker script to show the CPE ID of
> packages, if available. For now, it doesn't use CPE IDs to match CVEs.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/cve-checker | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)

Since cve-checker is no longer part of Buildroot, this patch no longer
makes sense, and I marked it as Non Applicable in patchwork.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
