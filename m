From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 22:26:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnss: fix build with old PPC
 ABI
In-Reply-To: <20200617200251.31283-1-joseph.kogut@gmail.com>
References: <20200617200251.31283-1-joseph.kogut@gmail.com>
Message-ID: <20200617222635.4b81dc63@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Jun 2020 13:02:51 -0700
Joseph Kogut <joseph.kogut@gmail.com> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/bdbd33c7a764931b2066dd8b527dde2f5dc298b4
> http://autobuild.buildroot.net/results/61bf50f73bb79e85c22e663f5fc22f4b9ccc0d3b
> http://autobuild.buildroot.net/results/4437942a528ab8f782d3b97595e76bb690d3a409
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  package/libnss/0001-fix-old-abi-ppc.patch | 43 +++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/libnss/0001-fix-old-abi-ppc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
