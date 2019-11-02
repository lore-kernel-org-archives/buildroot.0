From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Nov 2019 22:32:35 +0100
Subject: [Buildroot] [PATCH] package/proftpd: bump to 1.3.6b
In-Reply-To: <20191030150039.62821-1-matthew.weber@rockwellcollins.com>
References: <20191030150039.62821-1-matthew.weber@rockwellcollins.com>
Message-ID: <20191102223235.68200cd2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 30 Oct 2019 10:00:39 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> This bump incorporates the changes found while preparing the 1.3.7
> release and drops the CVE 2019-12815 patch which was incorporated in
> https://github.com/proftpd/proftpd/commit/a73dbfe3b61459e7c2806d5162b12f0957990cb3.
> 
> Adjusted the site location to point at github.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/proftpd/0002-fix-CVE-2019-12815.patch | 382 ------------------
>  package/proftpd/proftpd.hash                  |   4 +-
>  package/proftpd/proftpd.mk                    |   4 +-
>  3 files changed, 3 insertions(+), 387 deletions(-)
>  delete mode 100644 package/proftpd/0002-fix-CVE-2019-12815.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
