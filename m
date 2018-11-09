From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Nov 2018 22:20:59 +0100
Subject: [Buildroot] [PATCH 1/1] libffi: bump to version 3.3-rc0
In-Reply-To: <20181109180004.29604-1-fontaine.fabrice@gmail.com>
References: <20181109180004.29604-1-fontaine.fabrice@gmail.com>
Message-ID: <20181109222059.02b14ea5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Nov 2018 19:00:04 +0100, Fabrice Fontaine wrote:
> - Update site to github (for the time being, as 3.3-rc0 is a release
>   candidate, it is not published on the official ftp)
> - Update third patch
> - Remove fourth and fifth patches (already in version)
> - Remove uneeded hooks, as public headers are now installed in the
>   standard path since
>   https://github.com/libffi/libffi/commit/982b89c01aca99c7bc229914fc1521f96930919b
> - New risc-v support:
>   https://github.com/libffi/libffi/commit/3840d49aaa831d649b1597518a2903dfed0d57f3
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3edf66362ea5a83291f19373e4b6f2e5cce98d7b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-hardfloat-in-the-MIPS-assembly-code.patch |  5 +-
>  ...004-m68k-support-ISA-A-Coldfire-CPUs.patch | 77 -------------------
>  ...005-mips-use-__linux__-and-not-linux.patch | 37 ---------
>  package/libffi/libffi.hash                    |  4 +-
>  package/libffi/libffi.mk                      | 26 +------
>  5 files changed, 8 insertions(+), 141 deletions(-)
>  delete mode 100644 package/libffi/0004-m68k-support-ISA-A-Coldfire-CPUs.patch
>  delete mode 100644 package/libffi/0005-mips-use-__linux__-and-not-linux.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
