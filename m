From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 13:54:30 +0100
Subject: [Buildroot] [PATCH 1/3] package/boost: bump to version 1.59.0
In-Reply-To: <1449842279-22712-1-git-send-email-joerg.krause@embedded.rocks>
References: <1449842279-22712-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151212135430.2ecfa9af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Fri, 11 Dec 2015 14:57:57 +0100, J?rg Krause wrote:
> Also:
> * remove patch "gcc.jam compiler options fix" - merged upstream
> * renumber patch "fix uclibc eventfd".
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...eventfd.patch => 0002-fix-uclibc-eventfd.patch} |  0
>  .../boost/0002-gcc.jam-compiler-options-fix.patch  | 37 ----------------------
>  package/boost/boost.hash                           |  6 ++--
>  package/boost/boost.mk                             |  2 +-
>  4 files changed, 4 insertions(+), 41 deletions(-)
>  rename package/boost/{0004-fix-uclibc-eventfd.patch => 0002-fix-uclibc-eventfd.patch} (100%)
>  delete mode 100644 package/boost/0002-gcc.jam-compiler-options-fix.patch

All three patches merged, thanks! And thanks to Vicente for the
review/testing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
