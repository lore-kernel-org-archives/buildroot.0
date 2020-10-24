From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:57:06 +0200
Subject: [Buildroot] [PATCH] uclibc-ng-test: disable TLS for nds32 and
 s390x
In-Reply-To: <20201020090518.GA3322@waldemar-brodkorb.de>
References: <20201020090518.GA3322@waldemar-brodkorb.de>
Message-ID: <20201024225706.030dddee@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 20 Oct 2020 11:05:19 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/dac2a477a4de28d671c165e940db25364e291636
> http://autobuild.buildroot.net/results/84ca7104669bdc4fe538e526f3522e36b9bf666b
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc-ng-test/uclibc-ng-test.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
