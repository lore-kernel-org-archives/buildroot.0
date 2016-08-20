From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 11:45:57 +0200
Subject: [Buildroot] [PATCH] musl: fix a regression for mips
In-Reply-To: <20160819224134.GA8395@waldemar-brodkorb.de>
References: <20160819224134.GA8395@waldemar-brodkorb.de>
Message-ID: <20160820114557.209f33a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 00:41:34 +0200, Waldemar Brodkorb wrote:
> Add upstream patch to fix a regression regarding tcsetattr.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...regression-in-tcsetattr-on-all-mips-archs.patch | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 package/musl/0001-fix-regression-in-tcsetattr-on-all-mips-archs.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
