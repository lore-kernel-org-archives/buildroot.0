From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 22:11:48 +0200
Subject: [Buildroot] [PATCH 1/1] cups: bump version to 2.2.4
In-Reply-To: <20170828135216.31652-1-olivier.schonken@gmail.com>
References: <20170828135216.31652-1-olivier.schonken@gmail.com>
Message-ID: <20170830221148.03af31ca@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Aug 2017 15:52:16 +0200, Olivier Schonken wrote:
> Tweak 0003-Sanitize-the-installation-process.patch for 2.2.4
> Tweak 0004-Remove-PIE-flags-from-the-build.patch for 2.2.4
> Remove 0005-Fix-static-linking-with-GnuTLS.patch as it was merged upstream
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  .../0003-Sanitize-the-installation-process.patch   | 10 +++---
>  .../0004-Remove-PIE-flags-from-the-build.patch     |  7 ++--
>  .../cups/0005-Fix-static-linking-with-GnuTLS.patch | 39 ----------------------
>  package/cups/cups.hash                             |  2 +-
>  package/cups/cups.mk                               |  2 +-
>  5 files changed, 12 insertions(+), 48 deletions(-)
>  delete mode 100644 package/cups/0005-Fix-static-linking-with-GnuTLS.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
