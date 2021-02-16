From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Feb 2021 23:16:40 +0100
Subject: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: add
 ignored_cves to json output
In-Reply-To: <20210211092910.2108-1-heiko.thiery@gmail.com>
References: <20210211092910.2108-1-heiko.thiery@gmail.com>
Message-ID: <20210216231640.385d90b5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 11 Feb 2021 10:29:10 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Add the list of <pkg>_IGNORE_CVES to the json output to show that we have a
> known cause (available patch or the CVE is not valid for our package
> configuration) that a affected CVE is not reported.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  support/scripts/pkg-stats | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
