From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 22:46:02 +0200
Subject: [Buildroot] [PATCH] multicat: bump to version 2.2
In-Reply-To: <c2ce3c90b5f2b419e3d2e621db03832c5bae1901.1524115717.git.baruch@tkos.co.il>
References: <c2ce3c90b5f2b419e3d2e621db03832c5bae1901.1524115717.git.baruch@tkos.co.il>
Message-ID: <20180419224602.77ec8ed4@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Apr 2018 08:28:37 +0300, Baruch Siach wrote:
> Drop upstream patches.
> 
> Add upstream patch fixing build with musl libc.
> 
> Add license file hash.
> 
> Set LDLIBS to TARGET_LDFLAGS for TARGET_LDFLAGS to be added to the link
> commands. Makefile does not use the LDFLAGS environment variable. This
> fixes static linking.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0001-Fix-build-with-musl-libc.patch       | 62 +++++++++++++++++++
>  .../multicat/0001-Fix-missing-pthread.patch   | 20 ------
>  package/multicat/0002-Fix-musl-build.patch    | 47 --------------
>  ...Fix-have-clock-nanosleep-with-uclibc.patch | 24 -------
>  package/multicat/multicat.hash                |  7 ++-
>  package/multicat/multicat.mk                  |  6 +-
>  6 files changed, 70 insertions(+), 96 deletions(-)
>  create mode 100644 package/multicat/0001-Fix-build-with-musl-libc.patch
>  delete mode 100644 package/multicat/0001-Fix-missing-pthread.patch
>  delete mode 100644 package/multicat/0002-Fix-musl-build.patch
>  delete mode 100644 package/multicat/0003-Fix-have-clock-nanosleep-with-uclibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
