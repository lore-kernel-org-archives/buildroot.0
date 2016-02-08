From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Feb 2016 12:12:19 +0100
Subject: [Buildroot] [PATCH 1/2] package/nodejs: bump to version 5.5.0
In-Reply-To: <1454165460-32174-1-git-send-email-martin@barkynet.com>
References: <1454165460-32174-1-git-send-email-martin@barkynet.com>
Message-ID: <20160208121219.2d32d53d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Sat, 30 Jan 2016 14:50:59 +0000, Martin Bark wrote:
> Patches from 5.3.0 have been copied over with the following exceptions:
>  - Removed 0005-Fix-crash-in-GetInterfaceAddresses.patch as this has
>    been applied upstream
>  - Renamed 0006-Fix-support-for-uClibc-ng.patch to
>    0005-Fix-support-for-uClibc-ng.patch
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  .../0005-Fix-crash-in-GetInterfaceAddresses.patch  | 37 ----------------------
>  ...01-Remove-dependency-on-Python-bz2-module.patch |  0
>  .../0002-gyp-force-link-command-to-use-CXX.patch   |  0
>  ...hon-variable-instead-of-hardcoding-Python.patch |  0
>  .../0004-Fix-va_list-not-declared.patch            |  0
>  .../0005-Fix-support-for-uClibc-ng.patch}          |  0
>  package/nodejs/Config.in                           |  6 ++--
>  package/nodejs/nodejs.hash                         |  4 +--
>  8 files changed, 5 insertions(+), 42 deletions(-)
>  delete mode 100644 package/nodejs/5.3.0/0005-Fix-crash-in-GetInterfaceAddresses.patch
>  rename package/nodejs/{5.3.0 => 5.5.0}/0001-Remove-dependency-on-Python-bz2-module.patch (100%)
>  rename package/nodejs/{5.3.0 => 5.5.0}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
>  rename package/nodejs/{5.3.0 => 5.5.0}/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch (100%)
>  rename package/nodejs/{5.3.0 => 5.5.0}/0004-Fix-va_list-not-declared.patch (100%)
>  rename package/nodejs/{5.3.0/0006-Fix-support-for-uClibc-ng.patch => 5.5.0/0005-Fix-support-for-uClibc-ng.patch} (100%)

Both patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
