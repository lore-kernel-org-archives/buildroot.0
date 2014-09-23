From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 21:48:59 +0200
Subject: [Buildroot] [PATCH 1/1] Bump version and remove strcmp patch
In-Reply-To: <1411499885-11350-1-git-send-email-limpens@gmail.com>
References: <1411499885-11350-1-git-send-email-limpens@gmail.com>
Message-ID: <20140923214859.4816d398@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Limpens,

On Tue, 23 Sep 2014 21:18:05 +0200, Eric Limpens wrote:
> - Bump version to git revision 0bf57f9...
> - Remove strcmp patch, has been fixed upstream
> 
> Signed-off-by: Eric Limpens <limpens@gmail.com>
> ---
>  package/pifmrds/pifmrds-0003-rds_wav-strcmp.patch | 17 -----------------
>  package/pifmrds/pifmrds.mk                        |  2 +-
>  2 files changed, 1 insertion(+), 18 deletions(-)
>  delete mode 100644 package/pifmrds/pifmrds-0003-rds_wav-strcmp.patch

Thanks, I've applied your patch. However, I had to tweak the commit
title to:

	pifmrds: bump version and remove strcmp patch

because we like to have all patches to have a prefix that indicates the
area of Buildroot being modified by the patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
