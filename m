From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 13:27:33 +0200
Subject: [Buildroot] [PATCH 3/4] package/lcdapi: bump version to v0.10
In-Reply-To: <1465161963-32681-3-git-send-email-bernd.kuhls@t-online.de>
References: <1465161963-32681-1-git-send-email-bernd.kuhls@t-online.de>
 <1465161963-32681-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160607132733.5e4deae4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  5 Jun 2016 23:26:02 +0200, Bernd Kuhls wrote:
> Removed patch to fix docs install after upstream fixed the problem:
> https://github.com/spdawson/lcdapi/commit/34e1d3b26055b02cecb7e738574b8fddcc2ab5eb
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...0001-Remove-installation-of-docs-examples.patch | 39 ----------------------
>  package/lcdapi/lcdapi.mk                           |  2 +-
>  2 files changed, 1 insertion(+), 40 deletions(-)
>  delete mode 100644 package/lcdapi/0001-Remove-installation-of-docs-examples.patch

Applied to master, thanks. It would also be good to add a hash file to
this package.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
