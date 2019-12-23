From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 23:46:13 +0100
Subject: [Buildroot] [PATCH] package/libnss: fix build failure on
 powerpc without <sys/auxv.h>
In-Reply-To: <20191210121322.120920-1-giulio.benetti@benettiengineering.com>
References: <20191210121322.120920-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191223234613.127b4e2c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Dec 2019 13:13:22 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add patch to fix build failure on PowerPc without <sys/auxv.h>. The patch
> inserts #if statements to include or note <sys/auxv.h> prior it exists.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8bf95bd8a0aec8c53889308ab1e00d0a94f53d57/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...Fix-PowerPc-build-sys-auxv.h-failure.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/libnss/0004-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
