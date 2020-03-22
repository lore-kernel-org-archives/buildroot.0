From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 22:15:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/domoticz: bump to version 2020.1
In-Reply-To: <20200322162123.229407-1-fontaine.fabrice@gmail.com>
References: <20200322162123.229407-1-fontaine.fabrice@gmail.com>
Message-ID: <20200322221550.6380fd65@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Mar 2020 17:21:23 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove first patch (not needed anymore)
> - Update second patch
> - Remove third to fifth patches (already in version)
> - Add a mandatory jsoncpp dependency instead of using builtin jsoncpp:
>   https://github.com/domoticz/domoticz/commit/301fcfbd80e254282bbb4664c53f5f70467ae827
> - Update indentation of hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...story.txt-use-10717-instead-of-xxxxx.patch | 33 --------
>  ...Make-configuration-file-to-use-vers.patch} | 10 ++-
>  ...dd-c-argument-to-build-precompiled-h.patch | 34 ---------
>  ...ayedLink.h-fix-build-with-python-3-8.patch | 66 ----------------
>  ...onfuse-local-files-with-system-files.patch | 76 -------------------
>  package/domoticz/Config.in                    |  1 +
>  package/domoticz/domoticz.hash                |  4 +-
>  package/domoticz/domoticz.mk                  |  6 +-
>  8 files changed, 16 insertions(+), 214 deletions(-)
>  delete mode 100644 package/domoticz/0001-History.txt-use-10717-instead-of-xxxxx.patch
>  rename package/domoticz/{0002-Revert-Updating-CMake-configuration-file-to-use-vers.patch => 0001-Revert-Updating-CMake-configuration-file-to-use-vers.patch} (81%)
>  delete mode 100644 package/domoticz/0003-CMakeLists.txt-add-c-argument-to-build-precompiled-h.patch
>  delete mode 100644 package/domoticz/0004-DelayedLink.h-fix-build-with-python-3-8.patch
>  delete mode 100644 package/domoticz/0005-Fix-include-paths-to-not-confuse-local-files-with-system-files.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
