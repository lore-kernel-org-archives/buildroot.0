From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Aug 2016 15:57:19 +0200
Subject: [Buildroot] [PATCH] elf2flt: fix threading apps on ARM noMMU
 systems
In-Reply-To: <20160824210342.GA7164@waldemar-brodkorb.de>
References: <20160824210342.GA7164@waldemar-brodkorb.de>
Message-ID: <20160825155719.059243f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Aug 2016 23:03:43 +0200, Waldemar Brodkorb wrote:
> See this thread, which explains the problem in detail:
> http://mailman.uclinux.org/pipermail/uclinux-dev//2016-April/052713.html
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  This should be applied to master.
> ---
>  ...-relocation-support-for-R_ARM_TARGET-type.patch | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/elf2flt/0001-elf2flt-fix-relocation-support-for-R_ARM_TARGET-type.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
