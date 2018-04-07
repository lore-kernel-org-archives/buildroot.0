From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Apr 2018 13:46:10 +0200
Subject: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.2.5
In-Reply-To: <20180407072909.25962-1-asafka7@gmail.com>
References: <20180407072909.25962-1-asafka7@gmail.com>
Message-ID: <20180407134610.559ddfb2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 Apr 2018 10:29:09 +0300, Asaf Kahlon wrote:
> Update the ZEROMQ_SITE with the active repository.
> Remove the two patches because they were both applied on zeromq.
> As a result, the ZEROMQ_AUTORECONF was removed.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  ...e.m4-make-kernel-specific-flags-cacheable.patch | 199 ---------------------
>  ...q-Fix-pkg-config-files-for-static-linking.patch |  29 ---
>  package/zeromq/zeromq.hash                         |   9 +-
>  package/zeromq/zeromq.mk                           |   6 +-
>  4 files changed, 7 insertions(+), 236 deletions(-)
>  delete mode 100644 package/zeromq/0001-acinclude.m4-make-kernel-specific-flags-cacheable.patch
>  delete mode 100644 package/zeromq/0002-libzmq-Fix-pkg-config-files-for-static-linking.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
