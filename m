From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Aug 2015 15:44:48 +0200
Subject: [Buildroot] [PATCH] package/util-linux: fix vipw build with musl
In-Reply-To: <1439114750-11060-1-git-send-email-romain.naour@openwide.fr>
References: <1439114750-11060-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150810154448.42bc806d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun,  9 Aug 2015 12:05:50 +0200, Romain Naour wrote:
> __P() is used for compatibility with old K&R C compilers. With
> ANSI C this macro has no effect.
> 
> This fixes a compilation error with musl libc because of undeclared
> __P.
> 
> Fixes:
> http://autobuild.buildroot.net/results/237/2377ae85bb9d85ba4c02706207f0b3bde3ccd027
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  ...004-vipw-Remove-pre-ANSI-compiler-support.patch | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/util-linux/0004-vipw-Remove-pre-ANSI-compiler-support.patch

Applied, thanks. Can you submit the patch upstream?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
