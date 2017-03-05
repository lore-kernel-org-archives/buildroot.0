From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 22:00:50 +0100
Subject: [Buildroot] [PATCH] chocolate-doom: bump to version 2.3.0
In-Reply-To: <1488739214-32676-1-git-send-email-rprebello@gmail.com>
References: <1488739214-32676-1-git-send-email-rprebello@gmail.com>
Message-ID: <20170305220050.7f2732f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  5 Mar 2017 15:40:14 -0300, Rodrigo Rebello wrote:
> Also remove patches that have been merged upstream.
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> ---
>  ...ruct-attribute-directive-ignored-warnings.patch | 49 -------------
>  ...-configure-fix-with-PACKAGE-option-checks.patch | 67 ------------------
>  ...se-of-ioperm-inb-outb-to-x86-architecture.patch | 80 ----------------------
>  package/chocolate-doom/chocolate-doom.hash         |  2 +-
>  package/chocolate-doom/chocolate-doom.mk           |  2 +-
>  5 files changed, 2 insertions(+), 198 deletions(-)
>  delete mode 100644 package/chocolate-doom/0001-Fix-gcc_struct-attribute-directive-ignored-warnings.patch
>  delete mode 100644 package/chocolate-doom/0002-configure-fix-with-PACKAGE-option-checks.patch
>  delete mode 100644 package/chocolate-doom/0003-opl-limit-use-of-ioperm-inb-outb-to-x86-architecture.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
