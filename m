From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:16:36 +0200
Subject: [Buildroot] [PATCH 1/1] libxml2: bump to version 2.9.5
In-Reply-To: <20170905122010.19409-4-aduskett@gmail.com>
References: <20170905122010.19409-1-aduskett@gmail.com>
 <20170905122010.19409-4-aduskett@gmail.com>
Message-ID: <20170905211636.26e54490@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Sep 2017 08:20:08 -0400, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  ...ix-XPointer-paths-beginning-with-range-to.patch | 178 ---------------
>  ...sallow-namespace-nodes-in-XPointer-ranges.patch | 253 ---------------------
>  package/libxml2/libxml2.hash                       |   2 +-
>  package/libxml2/libxml2.mk                         |   2 +-
>  4 files changed, 2 insertions(+), 433 deletions(-)
>  delete mode 100644 package/libxml2/0001-Fix-XPointer-paths-beginning-with-range-to.patch
>  delete mode 100644 package/libxml2/0002-Disallow-namespace-nodes-in-XPointer-ranges.patch

Applied to master, after improving the commit log following the comment
from Baruch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
