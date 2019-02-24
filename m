From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Feb 2019 21:31:03 +0100
Subject: [Buildroot] [PATCH v1] qt5base: fix double-conversion compile
 for riscv
In-Reply-To: <20190216094832.9515-1-ps.report@gmx.net>
References: <20190216094832.9515-1-ps.report@gmx.net>
Message-ID: <20190224213103.74ffeb90@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 16 Feb 2019 10:48:32 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes [1], [2]:
> 
>   ../3rdparty/double-conversion/include/double-conversion/utils.h:83:2: error: #error Target architecture was not detected as supported by Double-Conversion.
> 
> [1] http://autobuild.buildroot.net/results/8bdb6a2b56f6ea96649184e5fef6ce2c56b9ec2b
> [2] http://autobuild.buildroot.net/results/63ba267674b424786bb10c97c565f4306147f95a
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...5-double-conversion-enable-for-riscv.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/qt5/qt5base/5.11.3/0005-double-conversion-enable-for-riscv.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
