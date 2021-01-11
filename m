From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 11 Jan 2021 23:37:35 +0100
Subject: [Buildroot] [PATCH 08/10] support/script/pkg-stats: show CPE ID
 in results
In-Reply-To: <20201104145145.1316167-9-thomas.petazzoni@bootlin.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-9-thomas.petazzoni@bootlin.com>
Message-ID: <1a31c390-c2bd-5867-aa49-2f2a5c4edf33@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Thomas,

On 04/11/2020 15:51, Thomas Petazzoni wrote:
> |From: Gregory CLEMENT <gregory.clement@bootlin.com> This commit improves the
> pkg-stats script to show the CPE ID of packages, if available. For now, it
> doesn't use CPE IDs to match CVEs. 

> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>|

 This and the following two patches have received quite a few comments. However,
it's not entirely clear to me if I should mark it as Changes Requested in
patchwork, or just apply it as is...

 Regards,
 Arnout
