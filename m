From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 21:04:43 +0100
Subject: [Buildroot] [PATCH] classpath: add patch to fix or1k compile
 error
In-Reply-To: <20170226193047.GA29453@waldemar-brodkorb.de>
References: <20170226193047.GA29453@waldemar-brodkorb.de>
Message-ID: <20170226210443.78361640@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Feb 2017 20:30:47 +0100, Waldemar Brodkorb wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/a0bb5535fd197b9dd1607a5f0bca477c9575c99f
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/classpath/0003-add-or1k-endian.patch | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 package/classpath/0003-add-or1k-endian.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
