From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 11:46:00 +0200
Subject: [Buildroot] [PATCH] libffi: fix m68k coldfire compile
In-Reply-To: <20160819231712.GA23890@waldemar-brodkorb.de>
References: <20160819231712.GA23890@waldemar-brodkorb.de>
Message-ID: <20160820114600.5a723e84@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 01:17:12 +0200, Waldemar Brodkorb wrote:
> Fix suggested upstream:
> https://github.com/libffi/libffi/pull/273
> 
> Fixes:
>   http://autobuild.buildroot.net/results/1014a22cfdd3b18f349dde33f14acca4131dbd5b/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .../0004-m68k-support-ISA-A-Coldfire-CPUs.patch    |   77 ++++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 package/libffi/0004-m68k-support-ISA-A-Coldfire-CPUs.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
