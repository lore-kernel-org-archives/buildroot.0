From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 22:04:53 +0200
Subject: [Buildroot] [PATCH 01/01] sngrep: bump version to v1.4.3
In-Reply-To: <20170525143412.3318-1-aduskett@codeblue.com>
References: <20170525143412.3318-1-aduskett@codeblue.com>
Message-ID: <20170531220453.683484a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 May 2017 10:34:12 -0400, Adam Duskett wrote:
> The two patches were committed upstream.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> ---
>  .../0001-src-Makefile.am-don-t-use-VPATH.patch     | 43 -------------
>  ...e.ac-switch-to-pkg-config-to-find-openssl.patch | 75 ----------------------
>  package/sngrep/sngrep.hash                         |  2 +-
>  package/sngrep/sngrep.mk                           |  2 +-
>  4 files changed, 2 insertions(+), 120 deletions(-)
>  delete mode 100644 package/sngrep/0001-src-Makefile.am-don-t-use-VPATH.patch
>  delete mode 100644 package/sngrep/0002-configure.ac-switch-to-pkg-config-to-find-openssl.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
