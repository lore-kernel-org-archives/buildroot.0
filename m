From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 12:10:25 +0200
Subject: [Buildroot] [PATCH 1/2] psmisc: bump to version 23.1
In-Reply-To: <f47611d9867fd591625d0d90a9134c0221c3ce38.1498135170.git.baruch@tkos.co.il>
References: <f47611d9867fd591625d0d90a9134c0221c3ce38.1498135170.git.baruch@tkos.co.il>
Message-ID: <20170624121025.2d46f882@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Jun 2017 15:39:29 +0300, Baruch Siach wrote:
> Forward port 0001-link-against-libintl.patch. Since now autoreconf works, move
> the patch from Makefile.in to Makefile.am. Also, convert to git format.
> 
> Remove 0002-no-__progname.patch. Buildroot default uClibc and musl now provide
> __progname.
> 
> Add a patch that adds the git-version-gen script to fix autoreconf.
> 
> Remove upstream patch.
> 
> Upstream switched to .xz tarballs.
> 
> Add upstream provided hashes.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/psmisc/0001-link-against-libintl.patch |  44 +++---
>  package/psmisc/0002-add-git-version-get.patch  | 198 +++++++++++++++++++++++++
>  package/psmisc/0002-no-__progname.patch        |  47 ------
>  package/psmisc/psmisc.hash                     |   6 +-
>  package/psmisc/psmisc.mk                       |  12 +-
>  5 files changed, 235 insertions(+), 72 deletions(-)
>  create mode 100644 package/psmisc/0002-add-git-version-get.patch
>  delete mode 100644 package/psmisc/0002-no-__progname.patch

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
