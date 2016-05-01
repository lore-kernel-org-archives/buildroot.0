From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 22:22:00 +0200
Subject: [Buildroot] [PATCH] package/mpd: bump to version 0.19.15
In-Reply-To: <1462123189-10795-1-git-send-email-joerg.krause@embedded.rocks>
References: <1462123189-10795-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160501222200.7d442cfa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 May 2016 19:19:49 +0200, J?rg Krause wrote:
> Drop patches applied upstream:
>  - 0001: notify: Don't use constexpr on Haiku
>  - 0002: notify: use "constexpr" only with glibc
> 
> Renumber remaining patches.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...onfigure.ac-check-if-libatomic-is-needed.patch} |  0
>  .../0001-notify-Don-t-use-constexpr-on-Haiku.patch | 28 -------------------
>  ...0002-notify-use-constexpr-only-with-glibc.patch | 31 ----------------------
>  ...d-Name-include-stdio.h-for-prctl-as-well.patch} |  0
>  package/mpd/mpd.hash                               |  2 +-
>  package/mpd/mpd.mk                                 |  2 +-
>  6 files changed, 2 insertions(+), 61 deletions(-)
>  rename package/mpd/{0003-configure.ac-check-if-libatomic-is-needed.patch => 0001-configure.ac-check-if-libatomic-is-needed.patch} (100%)
>  delete mode 100644 package/mpd/0001-notify-Don-t-use-constexpr-on-Haiku.patch
>  delete mode 100644 package/mpd/0002-notify-use-constexpr-only-with-glibc.patch
>  rename package/mpd/{0004-thread-Name-include-stdio.h-for-prctl-as-well.patch => 0002-thread-Name-include-stdio.h-for-prctl-as-well.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
