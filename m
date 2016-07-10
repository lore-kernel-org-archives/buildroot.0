From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Jul 2016 15:22:14 +0200
Subject: [Buildroot] [PATCH] dante: fix sparc compile issue
In-Reply-To: <20160710093213.GA32465@waldemar-brodkorb.de>
References: <20160710093213.GA32465@waldemar-brodkorb.de>
Message-ID: <20160710152214.32c71c32@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jul 2016 11:32:13 +0200, Waldemar Brodkorb wrote:
> Fixes following autobuild failure:
> http://autobuild.buildroot.net/results/536d95a46ef9527c6ed38b397f7e1b33f4b7b5fe/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/dante/0001-fix-sparc-compile.patch | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 package/dante/0001-fix-sparc-compile.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
