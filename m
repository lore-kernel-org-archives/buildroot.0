From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Nov 2020 16:37:12 +0100
Subject: [Buildroot] [PATCH 05/10] package/pkg-utils.mk: expose CPE ID
 in show-info when available
In-Reply-To: <20201104145145.1316167-6-thomas.petazzoni@bootlin.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-6-thomas.petazzoni@bootlin.com>
Message-ID: <20201126163712.653cf787@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Nov 2020 15:51:39 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> This commit exposes a new per-package property in the "make show-info"
> JSON output: "cpe-id", which exists when a valid CPE ID is available
> for the package.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-utils.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to next, thanks to the review/testing from Matt and Heiko.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
