From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Jan 2019 18:40:10 +0100
Subject: [Buildroot] [PATCH 1/1] systemd: fix build with older kernels
In-Reply-To: <20190111165018.17900-1-fontaine.fabrice@gmail.com>
References: <20190111165018.17900-1-fontaine.fabrice@gmail.com>
Message-ID: <20190112184010.5cccfad4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Jan 2019 17:50:18 +0100, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/699c078aa078240c6741da4dbd0871450ceeca92
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...pability-fix-build-without-PR_CAP_AMBIENT.patch | 61 ++++++++++++++++++++++
>  ...mpfile-util.c-fix-build-without-O_TMPFILE.patch | 34 ++++++++++++
>  ...0006-missing_if_link.h-add-IFLA_BOND_MODE.patch | 49 +++++++++++++++++
>  .../0007-missing_syscall.h-include-errno.h.patch   | 28 ++++++++++
>  ...file-util.c-fix-build-without-F_OFD_SETLK.patch | 34 ++++++++++++
>  5 files changed, 206 insertions(+)
>  create mode 100644 package/systemd/0004-capability-fix-build-without-PR_CAP_AMBIENT.patch
>  create mode 100644 package/systemd/0005-basic-tmpfile-util.c-fix-build-without-O_TMPFILE.patch
>  create mode 100644 package/systemd/0006-missing_if_link.h-add-IFLA_BOND_MODE.patch
>  create mode 100644 package/systemd/0007-missing_syscall.h-include-errno.h.patch
>  create mode 100644 package/systemd/0008-lockfile-util.c-fix-build-without-F_OFD_SETLK.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
