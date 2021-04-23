From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Apr 2021 23:18:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/domoticz: bump to version 2021.1
In-Reply-To: <20210422183011.655442-1-fontaine.fabrice@gmail.com>
References: <20210422183011.655442-1-fontaine.fabrice@gmail.com>
Message-ID: <20210423231809.65bb304a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 22 Apr 2021 20:30:11 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop all patches (already in version)
> - USE_BUILTIN_LUA has been removed since
>   https://github.com/domoticz/domoticz/commit/275effddf0921698197dbc38bde199c48d4956f9
> - cereal is a mandatory dependency since
>   https://github.com/domoticz/domoticz/commit/275effddf0921698197dbc38bde199c48d4956f9
> - fmt is a mandatory dependency since
>   https://github.com/domoticz/domoticz/commit/f049d7d574aae0ab0da1b8a042c59b420106e31c
> - Remaining external dependencies (such as minizip which is not
>   compatible with our fork of minizip) must be retrieved through git
>   submodules since
>   https://github.com/domoticz/domoticz/commit/275effddf0921698197dbc38bde199c48d4956f9
> 
> https://github.com/domoticz/domoticz/blob/2021.1/History.txt
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/370/3709e3cd96351ab35d5a8441658faf9bd51cd118
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ind-placeholders-in-global-namespace.patch | 843 ------------------
>  .../0002-Build-failure-with-python-3-9.patch  |  36 -
>  .../0003-Load-python-3-9-shared-libs.patch    |  41 -
>  package/domoticz/Config.in                    |   2 +
>  package/domoticz/domoticz.hash                |   2 +-
>  package/domoticz/domoticz.mk                  |  12 +-
>  6 files changed, 11 insertions(+), 925 deletions(-)
>  delete mode 100644 package/domoticz/0001-Avoid-deprecated-bind-placeholders-in-global-namespace.patch
>  delete mode 100644 package/domoticz/0002-Build-failure-with-python-3-9.patch
>  delete mode 100644 package/domoticz/0003-Load-python-3-9-shared-libs.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
