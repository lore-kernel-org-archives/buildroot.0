From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jan 2014 10:00:53 +0100
Subject: [Buildroot] [PATCH 1/1] minidlna: bump version to 1.1.1
In-Reply-To: <BLU0-SMTP1245369C4049BDF785E78C9D9C80@phx.gbl>
References: <BLU0-SMTP1245369C4049BDF785E78C9D9C80@phx.gbl>
Message-ID: <20140102100053.36532f4d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 1 Jan 2014 21:42:49 +0100, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
> ---
>  .../minidlna-0001-fix-genconfig-script.patch       |   95 --------------------
>  package/minidlna/minidlna-0002-fix-Makefile.patch  |   20 -----
>  .../minidlna-0003-fix-missing-include.patch        |   19 ----
>  .../minidlna-0004-fix-libavformat-use.patch        |   20 -----
>  package/minidlna/minidlna.mk                       |   45 +---------
>  5 files changed, 4 insertions(+), 195 deletions(-)
>  delete mode 100644 package/minidlna/minidlna-0001-fix-genconfig-script.patch
>  delete mode 100644 package/minidlna/minidlna-0002-fix-Makefile.patch
>  delete mode 100644 package/minidlna/minidlna-0003-fix-missing-include.patch
>  delete mode 100644 package/minidlna/minidlna-0004-fix-libavformat-use.patch

Thanks, but for such massive changes made to bump a package, please
write a more detailed commit log that details:

 * Why some patches are removed.
 * What are the different changes in the .mk file made for.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
