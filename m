From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 22:13:10 +0200
Subject: [Buildroot] [PATCH] uclibc: fix mips/mips64 build with older
 compilers
In-Reply-To: <20161009193913.GA31529@waldemar-brodkorb.de>
References: <20161009193913.GA31529@waldemar-brodkorb.de>
Message-ID: <20161009221310.41a3f944@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 9 Oct 2016 21:39:13 +0200, Waldemar Brodkorb wrote:
> For example gcc 4.8.x fails to build uClibc-ng for mips/mips64.
> Check if feature exist before using it.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...5-fix-mips-mips64-build-for-old-compilers.patch | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/uclibc/0005-fix-mips-mips64-build-for-old-compilers.patch

Applied to master, thanks for fixing this so quickly!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
