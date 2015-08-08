From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 13:00:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: bump to version
 2015.07
In-Reply-To: <1438720196-28247-1-git-send-email-joerg.krause@embedded.rocks>
References: <1438720196-28247-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150808130023.0a48b492@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Tue,  4 Aug 2015 22:29:56 +0200, J?rg Krause wrote:
> Also:
>   - update patch #1
>   - remove patch #3 and #4 -> applied upstream
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  .../uboot-tools/0001-drop-configh-from-tools.patch | 25 +++++++-
>  package/uboot-tools/0003-Fix-musl-build.patch      | 71 ----------------------
>  ...kg-config-when-available-to-get-SSL-flags.patch | 39 ------------
>  package/uboot-tools/uboot-tools.hash               |  2 +-
>  package/uboot-tools/uboot-tools.mk                 |  2 +-
>  5 files changed, 24 insertions(+), 115 deletions(-)
>  delete mode 100644 package/uboot-tools/0003-Fix-musl-build.patch
>  delete mode 100644 package/uboot-tools/0004-tools-use-pkg-config-when-available-to-get-SSL-flags.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
