From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 22:23:38 +0100
Subject: [Buildroot] [PATCH v2] gcc: add patch to support musl on ppc
In-Reply-To: <20161127155704.GA10600@waldemar-brodkorb.de>
References: <20161127155704.GA10600@waldemar-brodkorb.de>
Message-ID: <20161127222338.400326f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Nov 2016 16:57:04 +0100, Waldemar Brodkorb wrote:
> Tested with a boot in Qemu (g3beige).
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2: 
>   * remove my temporary foo file while investigating what patches
>     are required, requested by Thomas Petazzoni
> ---
>  package/gcc/5.4.0/911-ppc-musl-support.patch | 75 ++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 package/gcc/5.4.0/911-ppc-musl-support.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
