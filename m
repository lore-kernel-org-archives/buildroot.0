From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 23:12:30 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix uClibc-ng 64bit
 dynamic loader link
In-Reply-To: <b301100fe3edad0eed23cf5557548fe014410899.1437035134.git.baruch@tkos.co.il>
References: <b301100fe3edad0eed23cf5557548fe014410899.1437035134.git.baruch@tkos.co.il>
Message-ID: <20150716231230.23eb7197@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 16 Jul 2015 11:25:34 +0300, Baruch Siach wrote:
> Commit 34f95bf9dbb0 (toolchain-external: fix support of uClibc-ng toolchains,
> 2015-07-13) added the missing ld-uClibc.so.1 dynamic linker symlink that
> binaries expect when linked with uClibc-ng. However on 64bit targets the
> linker is called ld64-uClibc.so.1. Handle that case as well.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
