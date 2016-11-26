From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Nov 2016 15:00:58 +0100
Subject: [Buildroot] [PATCH] qemu-ppc: fixup wrong startup example,
 use either -hda or -drive
In-Reply-To: <20161126084257.GA22440@waldemar-brodkorb.de>
References: <20161126084257.GA22440@waldemar-brodkorb.de>
Message-ID: <20161126150058.59129a30@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 26 Nov 2016 09:42:58 +0100, Waldemar Brodkorb wrote:
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks!

>  While playing with musl+ppc I recognized this.
>  Musl-PPC with gcc 5.x is broken, as the gcc patches are incomplete.
>  gcc 6.x works with the qemu samples, so maybe disable gcc 5.x for
>  musl ppc?

Or better: add the appropriate patches to make musl/gcc5/ppc work
properly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
