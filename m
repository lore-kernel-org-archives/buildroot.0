From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Oct 2017 22:14:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/openjpeg: bump version to 2.3.0
In-Reply-To: <20171015202717.22211-1-bernd.kuhls@t-online.de>
References: <20171015202717.22211-1-bernd.kuhls@t-online.de>
Message-ID: <20171018221450.4a25a69f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 Oct 2017 22:27:17 +0200, Bernd Kuhls wrote:
> Removed patch 0003, applied upstream:
> https://github.com/uclouvain/openjpeg/commit/51a1dcaa6ed5713520dca36fc58cd9240c08b7ca
> 
> Renamed patch 0004.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...MakeLists.txt-Don-t-require-a-C-compiler.patch} |  0
>  .../0003-avoid-malloc-poisoning-issue.patch        | 54 ----------------------
>  package/openjpeg/openjpeg.hash                     |  2 +-
>  package/openjpeg/openjpeg.mk                       |  2 +-
>  4 files changed, 2 insertions(+), 56 deletions(-)
>  rename package/openjpeg/{0004-CMakeLists.txt-Don-t-require-a-C-compiler.patch => 0003-CMakeLists.txt-Don-t-require-a-C-compiler.patch} (100%)
>  delete mode 100644 package/openjpeg/0003-avoid-malloc-poisoning-issue.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
