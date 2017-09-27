From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Sep 2017 21:17:23 +0200
Subject: [Buildroot] [PATCH 1/2] dash: bump to version 0.5.9.1
In-Reply-To: <1506530514-27185-1-git-send-email-casantos@datacom.ind.br>
References: <1506530514-27185-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170927211723.6d35b72c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Sep 2017 13:41:53 -0300, Carlos Santos wrote:
> Use the maintainer's repository, update the package description, based
> on the official one, and drop an obsolete patch.
> 
> Change-Id: I2170aa4c1cc57de2a25ef04e89a216b254f2a859
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/dash/0002-fix-parallel-build.patch | 40 ------------------------------
>  package/dash/Config.in                     |  6 +++--
>  package/dash/dash.hash                     |  5 ++--
>  package/dash/dash.mk                       | 10 +++-----
>  4 files changed, 9 insertions(+), 52 deletions(-)
>  delete mode 100644 package/dash/0002-fix-parallel-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
