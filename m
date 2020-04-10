From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Apr 2020 22:59:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/freerdp: security bump to
 version 2.0.0
In-Reply-To: <20200410184059.5302-1-fontaine.fabrice@gmail.com>
References: <20200410184059.5302-1-fontaine.fabrice@gmail.com>
Message-ID: <20200410225944.3485982b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Apr 2020 20:40:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> From the ChangeLog:
> - Fix multiple CVEs: CVE-2020-11521 CVE-2020-11522 CVE-2020-11523
>   CVE-2020-11524 CVE-2020-11525 CVE-2020-11526
> - Fix multiple other security related issues (#6005, #6006, #6007,
>   #6008, #6009, #6010, #6011, #6012, #6013)
> 
> - Retrieve official tarball
> - Drop patch (already in version)
> - libusb is needed for urbdrc channel since
>   https://github.com/FreeRDP/FreeRDP/commit/0927d7aa50c76b671b55c33e0f06c950d1f08e9a
> - Add a patch to fix build on uclibc
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...uwac-uwac-os.c-fix-build-with-uclibc.patch | 44 +++++++++++++++++++
>  ..._floatbar.c-fix-build-without-Xfixes.patch | 32 --------------
>  package/freerdp/freerdp.hash                  |  6 ++-
>  package/freerdp/freerdp.mk                    | 11 ++++-
>  4 files changed, 57 insertions(+), 36 deletions(-)
>  create mode 100644 package/freerdp/0001-src-libuwac-uwac-os.c-fix-build-with-uclibc.patch
>  delete mode 100644 package/freerdp/0001-xf_floatbar.c-fix-build-without-Xfixes.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
