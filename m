From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Oct 2014 22:10:13 +0200
Subject: [Buildroot] [PATCH 1/2] package/xenomai: bump to version 2.6.4
In-Reply-To: <1412279622-5553-1-git-send-email-romain.naour@openwide.fr>
References: <1412279622-5553-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141003221013.5db9e37a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Thu,  2 Oct 2014 21:53:41 +0200, Romain Naour wrote:
> Remove upstreamed patches.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  .../xenomai-0001-arm-enable-armv5tej-support.patch | 40 ----------------------
>  ...uild-failure-when-HAVE_OPEN64-is-undefine.patch | 30 ----------------
>  package/xenomai/xenomai.mk                         |  2 +-
>  3 files changed, 1 insertion(+), 71 deletions(-)
>  delete mode 100644 package/xenomai/xenomai-0001-arm-enable-armv5tej-support.patch
>  delete mode 100644 package/xenomai/xenomai-0002-posix-fix-build-failure-when-HAVE_OPEN64-is-undefine.patch

Both patches applied.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
