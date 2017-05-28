From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 15:06:11 +0200
Subject: [Buildroot] [PATCH/next] package/elf2flt: bump version
In-Reply-To: <20170528110952.25395-1-bernd.kuhls@t-online.de>
References: <20170528110952.25395-1-bernd.kuhls@t-online.de>
Message-ID: <20170528150611.19e09692@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 May 2017 13:09:52 +0200, Bernd Kuhls wrote:
> Removed patch applied upstream:
> https://github.com/uclinux-dev/elf2flt/commit/a87f68ae9e879360a9624f2a02999e67cfbe5a2f
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...-relocation-support-for-R_ARM_TARGET-type.patch | 34 ----------------------
>  package/elf2flt/elf2flt.hash                       |  2 +-
>  package/elf2flt/elf2flt.mk                         |  2 +-
>  3 files changed, 2 insertions(+), 36 deletions(-)
>  delete mode 100644 package/elf2flt/0001-elf2flt-fix-relocation-support-for-R_ARM_TARGET-type.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
