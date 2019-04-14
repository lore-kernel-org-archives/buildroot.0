From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Apr 2019 14:56:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/util-linux: fix build with
 glibc 2.29
In-Reply-To: <20190414105833.4132-1-fontaine.fabrice@gmail.com>
References: <20190414105833.4132-1-fontaine.fabrice@gmail.com>
Message-ID: <20190414145625.1c6a4534@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 Apr 2019 12:58:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - No autobuilders failures yet (found with
>  qemu_mips64el_malta_defconfig)

I guess the issue only pops up on MIPS64 perhaps ? Because we do have
an autobuilder configuration testing ARM internal toolchain with glibc,
so it should have been detected by the autobuilders already if it was
not an architecture specific issue.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...alue-of_HAVE_STRUCT_TERMIOS_C_ISPEED.patch | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/util-linux/0004-ldattach-Check-for-value-of_HAVE_STRUCT_TERMIOS_C_ISPEED.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
