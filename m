From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 14:33:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/libffi: bump to version 3.2.1
In-Reply-To: <1442697301-15881-1-git-send-email-joerg.krause@embedded.rocks>
References: <1442697301-15881-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150920143331.6d866959@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat, 19 Sep 2015 23:15:01 +0200, J?rg Krause wrote:
> Also:
>   - unfuzz patches #1 and #2
>   - remove applied patches upstream
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  .../0001-Fix-installation-location-of-libffi.patch | 17 +++++---
>  ...0002-Fix-use-of-compact-eh-frames-on-MIPS.patch | 26 ++++++++++--
>  package/libffi/0003-fix-typo.patch                 | 41 -------------------
>  ...Add-missing-GNU-stack-markings-in-win32.S.patch | 36 -----------------
>  .../libffi/0005-Fix-paths-in-libffi.pc.in.patch    | 46 ----------------------
>  package/libffi/libffi.hash                         |  2 +-
>  package/libffi/libffi.mk                           |  2 +-
>  7 files changed, 35 insertions(+), 135 deletions(-)
>  delete mode 100644 package/libffi/0003-fix-typo.patch
>  delete mode 100644 package/libffi/0004-Add-missing-GNU-stack-markings-in-win32.S.patch
>  delete mode 100644 package/libffi/0005-Fix-paths-in-libffi.pc.in.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
