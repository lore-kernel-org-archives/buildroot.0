From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 23:04:59 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/nodejs: remove 0.10.x support
In-Reply-To: <1489493178-32646-1-git-send-email-martin@barkynet.com>
References: <1489493178-32646-1-git-send-email-martin@barkynet.com>
Message-ID: <20170314230459.6536c977@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 12:06:17 +0000, Martin Bark wrote:
> nodejs 0.10.x is now end of life and is no longer maintained so remove it.
> See https://github.com/nodejs/LTS
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> 
> ---
> Changes v1 -> v2:
>  - reorder patch to be before bumping version to 7.7.2 (Thomas Petazzoni)
> ---
>  .../0001-remove-python-bz2-dependency.patch        | 27 -------------
>  .../0002-gyp-force-link-command-to-use-CXX.patch   | 26 ------------
>  .../0003-fix-musl-USE-MISC-build-issue.patch       | 47 ----------------------
>  .../0.10.48/0004-Fix-support-for-uClibc-ng.patch   | 33 ---------------
>  .../0001-gyp-force-link-command-to-use-CXX.patch   |  0
>  ...-don-t-build-when-ssl-support-is-disabled.patch |  0
>  package/nodejs/Config.in                           | 32 +++++----------
>  package/nodejs/nodejs.hash                         |  3 --
>  package/nodejs/nodejs.mk                           |  7 +---
>  9 files changed, 11 insertions(+), 164 deletions(-)
>  delete mode 100644 package/nodejs/0.10.48/0001-remove-python-bz2-dependency.patch
>  delete mode 100644 package/nodejs/0.10.48/0002-gyp-force-link-command-to-use-CXX.patch
>  delete mode 100644 package/nodejs/0.10.48/0003-fix-musl-USE-MISC-build-issue.patch
>  delete mode 100644 package/nodejs/0.10.48/0004-Fix-support-for-uClibc-ng.patch
>  rename package/nodejs/{6.9.4 => }/0001-gyp-force-link-command-to-use-CXX.patch (100%)
>  rename package/nodejs/{6.9.4 => }/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch (100%)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
