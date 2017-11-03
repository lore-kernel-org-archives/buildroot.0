From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 22:03:23 +0100
Subject: [Buildroot] [PATCH 1/1] lxc: bump to version 2.1.1
In-Reply-To: <20171102220934.19446-1-fontaine.fabrice@gmail.com>
References: <20171102220934.19446-1-fontaine.fabrice@gmail.com>
Message-ID: <20171103220323.34c0b63b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Nov 2017 23:09:34 +0100, Fabrice Fontaine wrote:
> Remove 0001-conf-fix-build-without-libcap.patch (already in 2.1.1)
> Add 0001-Fix-compilation-on-toolchain-without-prlimit.patch (merged
> upstream)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-compilation-on-toolchain-without-prlimit.patch | 98 ++++++++++++++++++++++
>  .../lxc/0001-conf-fix-build-without-libcap.patch   | 31 -------
>  package/lxc/lxc.hash                               |  2 +-
>  package/lxc/lxc.mk                                 |  4 +-
>  4 files changed, 102 insertions(+), 33 deletions(-)
>  create mode 100644 package/lxc/0001-Fix-compilation-on-toolchain-without-prlimit.patch
>  delete mode 100644 package/lxc/0001-conf-fix-build-without-libcap.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
