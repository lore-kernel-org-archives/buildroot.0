From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Oct 2017 16:00:28 +0200
Subject: [Buildroot] [PATCH 1/1] Allow musl for ARMv4 to build with new
 binutils
In-Reply-To: <20170926060433.10202-1-timothy.ty.lee@gmail.com>
References: <fc351f04-83e7-3b7e-31eb-76a5baebcd06@mind.be>
 <20170926060433.10202-1-timothy.ty.lee@gmail.com>
Message-ID: <20171008160028.3397c341@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Sep 2017 16:04:33 +1000, Timothy Lee wrote:
> New binutils (since 2.27.51) cannot build musl-1.1.16 due to breakage in ARMv4
> atomics asm.  This patch from upstream musl repository is needed until
> musl-1.1.17 is released:
> https://git.musl-libc.org/cgit/musl/commit/?id=b261a24256792177a5f0531dbb25cc6267220ca5
> 
> Signed-off-by: Timothy Lee <timothy.ty.lee@gmail.com>
> ---
>  .../0002-arm-atomics-asm-with-new-binutils.patch   | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/musl/0002-arm-atomics-asm-with-new-binutils.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
