From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 21:52:14 +0200
Subject: [Buildroot] [PATCH] libpng: bump to version 1.6.22
In-Reply-To: <1464291227-1261-1-git-send-email-gustavo@zacarias.com.ar>
References: <1464291227-1261-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160526215214.2943d193@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 May 2016 16:33:47 -0300, Gustavo Zacarias wrote:
> Rebase patch 1 in git format, and rebase patch 2 against 1.6.22.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../0001-Disable-pngfix-and-png-fix-itxt.patch     | 44 ++++++++++++++++++++++
>  package/libpng/0001-disable-tools.patch            | 30 ---------------
>  ...prefix-to-symbol-names-in-version-script.patch} | 29 +++++++-------
>  package/libpng/libpng.hash                         |  6 +--
>  package/libpng/libpng.mk                           |  2 +-
>  5 files changed, 63 insertions(+), 48 deletions(-)
>  create mode 100644 package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch
>  delete mode 100644 package/libpng/0001-disable-tools.patch
>  rename package/libpng/{0002-ignore-symbol-prefix.patch => 0002-Don-t-append-prefix-to-symbol-names-in-version-script.patch} (64%)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
