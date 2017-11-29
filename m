From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 21:40:57 +0100
Subject: [Buildroot] [PATCH next] musl: bump to 1.1.18
In-Reply-To: <20171127101732.14622-1-thomas.petazzoni@free-electrons.com>
References: <20171127101732.14622-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171129214057.46ee53fa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Nov 2017 11:17:32 +0100, Thomas Petazzoni wrote:
> Patch 0002-arm-atomics-asm-with-new-binutils.patch is upstream as of
> commit b261a24256792177a5f0531dbb25cc6267220ca5.
> 
> Patch 0003-Makefile-include-per-arch-Makefile-before-Makefile is
> upstream as of commit 45ca5d3fcb6f874bf5ba55d0e9651cef68515395.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../0002-arm-atomics-asm-with-new-binutils.patch   | 43 ----------------------
>  ...ing-callback-enforce-MAXADDRS-to-preclude.patch | 35 ------------------
>  package/musl/musl.hash                             |  2 +-
>  package/musl/musl.mk                               |  2 +-
>  4 files changed, 2 insertions(+), 80 deletions(-)
>  delete mode 100644 package/musl/0002-arm-atomics-asm-with-new-binutils.patch
>  delete mode 100644 package/musl/0003-in-dns-parsing-callback-enforce-MAXADDRS-to-preclude.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
