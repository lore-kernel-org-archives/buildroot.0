From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:57:12 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: bump to version 1.43.6
In-Reply-To: <40f53a4f200ebfe8ba96d861513bd54c16c1107b.1504552281.git.baruch@tkos.co.il>
References: <40f53a4f200ebfe8ba96d861513bd54c16c1107b.1504552281.git.baruch@tkos.co.il>
Message-ID: <20170905215712.25fec5de@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Sep 2017 22:11:21 +0300, Baruch Siach wrote:
> Drop upstream patch.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0002-include-sys-sysmacros.h-as-needed.patch   | 129 ---------------------
>  package/e2fsprogs/e2fsprogs.hash                   |   4 +-
>  package/e2fsprogs/e2fsprogs.mk                     |   2 +-
>  3 files changed, 3 insertions(+), 132 deletions(-)
>  delete mode 100644 package/e2fsprogs/0002-include-sys-sysmacros.h-as-needed.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
