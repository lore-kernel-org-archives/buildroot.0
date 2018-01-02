From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Jan 2018 22:40:44 +0100
Subject: [Buildroot] [PATCH] package/sysdig: bump to version 0.19.1
In-Reply-To: <1514910326-24416-1-git-send-email-angelo@amarulasolutions.com>
References: <1514910326-24416-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180102224044.6bb26220@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Jan 2018 17:25:26 +0100, Angelo Compagnucci wrote:
> This patch bumps sysdig to version 0.19.1 and removes
> an upstreamed patch.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  .../sysdig/0001-Don-t-include-curlbuild.h.patch    | 58 ----------------------
>  package/sysdig/sysdig.hash                         |  2 +-
>  package/sysdig/sysdig.mk                           |  2 +-
>  3 files changed, 2 insertions(+), 60 deletions(-)
>  delete mode 100644 package/sysdig/0001-Don-t-include-curlbuild.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
