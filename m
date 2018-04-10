From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Apr 2018 14:54:23 +0200
Subject: [Buildroot] [PATCH] nmap: bump to version 7.70
In-Reply-To: <dd8327325d3bb6fb24bfb2acaa0d3ec65c031b84.1523360545.git.baruch@tkos.co.il>
References: <dd8327325d3bb6fb24bfb2acaa0d3ec65c031b84.1523360545.git.baruch@tkos.co.il>
Message-ID: <20180410145423.37b327b7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Apr 2018 14:42:25 +0300, Baruch Siach wrote:
> Drop libssh2 configure test fix; the issue is fixed upstream.
> 
> Add license file hash.
> 
> Cc: Carlos Santos <casantos@datacom.ind.br>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...c-fix-AC_CHECK_HEADER-call-to-test-for-li.patch | 30 ----------------------
>  package/nmap/nmap.hash                             |  6 +++--
>  package/nmap/nmap.mk                               | 12 ++-------
>  3 files changed, 6 insertions(+), 42 deletions(-)
>  delete mode 100644 package/nmap/0002-configure.ac-fix-AC_CHECK_HEADER-call-to-test-for-li.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
