From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 21:18:00 +0100
Subject: [Buildroot] [PATCH] jose: fix build with old compilers
In-Reply-To: <20171120222331.13672-1-thomas.petazzoni@free-electrons.com>
References: <20171120222331.13672-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171122211800.346900d5@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Nov 2017 23:23:31 +0100, Thomas Petazzoni wrote:
> This commit adds two patches to the jose package that fix the build
> with old compilers such as gcc 4.7.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/00d5a4b809922f8fa42c0de9d461c9754d2f8098
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../0001-lib-hsh.c-rename-hsh-local-variable.patch |  71 +++++++++
>  ...02-configure-fix-build-with-old-compilers.patch | 165 +++++++++++++++++++++
>  package/jose/jose.mk                               |   2 +
>  3 files changed, 238 insertions(+)
>  create mode 100644 package/jose/0001-lib-hsh.c-rename-hsh-local-variable.patch
>  create mode 100644 package/jose/0002-configure-fix-build-with-old-compilers.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
