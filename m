From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jan 2021 22:05:05 +0100
Subject: [Buildroot] [PATCH v2 0/5] Introduce CPE ID matching for CVEs
In-Reply-To: <20201204154601.125932-1-thomas.petazzoni@bootlin.com>
References: <20201204154601.125932-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210104220505.02f50dfc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  4 Dec 2020 16:45:56 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Gregory CLEMENT (1):
>   support/script/pkg-stats: show CPE ID in results
> 
> Matt Weber (1):
>   package: provide CPE ID details for numerous packages
> 
> Thomas Petazzoni (3):
>   support/scripts/{pkg-stats,cve.py}: support CPE ID based matching
>   support/scripts/pkg-stats: ignore packages with no valid infra and no
>     version for CVE checking
>   support/scripts/pkg-stats: improve rendering of CVE information

I have now merged this series, since he had no feedback since December
4, but positive feedback on its previous iteration.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
