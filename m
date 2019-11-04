From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 21:49:06 +0100
Subject: [Buildroot] [PATCH] package/rng-tools: replace non standard
 pthread_yield with sched_yield
In-Reply-To: <20191031073514.10739-1-matthew.weber@rockwellcollins.com>
References: <20191031073514.10739-1-matthew.weber@rockwellcollins.com>
Message-ID: <20191104214906.107b25cf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 31 Oct 2019 02:35:14 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> This patch fixes a musl build failure where the non-standard pthread_yield
> was used.
> 
> (Patch picked from upstream)
> 
> Fixes:
> http://autobuild.buildroot.net/results/7479b5193cc3d6b98bbd7db4e4682945133eb2ff/
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  ...ace-non-standard-pthread_yield-with-.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/rng-tools/0002-rngd_jitter-replace-non-standard-pthread_yield-with-.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
