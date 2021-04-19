From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Apr 2021 22:34:09 +0200
Subject: [Buildroot] [PATCH 1/2] package/domoticz: drop first patch
In-Reply-To: <20210418200730.3474374-1-fontaine.fabrice@gmail.com>
References: <20210418200730.3474374-1-fontaine.fabrice@gmail.com>
Message-ID: <20210419223409.06425d6f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 18 Apr 2021 22:07:29 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Patch not needed since commit 37f197f8634352750f169b6a287588a09b82e00e
> which bumped host-cmake dependency from 3.10 to 3.15
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...nd-placeholders-in-global-namespace.patch} |  0
>  ...CMake-configuration-file-to-use-vers.patch | 55 -------------------
>  ... 0002-Build-failure-with-python-3-9.patch} |  0
>  ...=> 0003-Load-python-3-9-shared-libs.patch} |  0  
>  4 files changed, 55 deletions(-)
>  rename package/domoticz/{0002-Avoid-deprecated-bind-placeholders-in-global-namespace.patch => 0001-Avoid-deprecated-bind-placeholders-in-global-namespace.patch} (100%)
>  delete mode 100644 package/domoticz/0001-Revert-Updating-CMake-configuration-file-to-use-vers.patch
>  rename package/domoticz/{0003-Build-failure-with-python-3-9.patch => 0002-Build-failure-with-python-3-9.patch} (100%)
>  rename package/domoticz/{0004-Load-python-3-9-shared-libs.patch => 0003-Load-python-3-9-shared-libs.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
