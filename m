From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 22:05:26 +0200
Subject: [Buildroot] [PATCH 3/5 v2] package/xorriso: fix to use the
 system xattr header
In-Reply-To: <6c7d039a9b5c4bcd728e3061be1bab895bd29ad5.1530368468.git.yann.morin.1998@free.fr>
References: <cover.1530368468.git.yann.morin.1998@free.fr>
 <6c7d039a9b5c4bcd728e3061be1bab895bd29ad5.1530368468.git.yann.morin.1998@free.fr>
Message-ID: <20180630220526.37a3df19@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Jun 2018 16:21:25 +0200, Yann E. MORIN wrote:
> We don't carry a git-formatted patch, because upstream is in fact a
> collection of git trees, while the release tarball is an aggregate
> of those repositories. Thus, the layout is different between the
> tarball and the SCM...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Steve Kenton <skenton@ou.edu>
> ---
>  package/xorriso/0001-use-sys-xattr.h.patch | 33 ++++++++++++++++++++++++++++++
>  package/xorriso/xorriso.mk                 | 13 ++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 package/xorriso/0001-use-sys-xattr.h.patch

Applied to master after fixing the issues we have discussed in this
thread. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
