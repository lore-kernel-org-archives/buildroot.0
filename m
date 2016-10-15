From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 12:24:07 +0200
Subject: [Buildroot] [PATCH 2/3] package/urg: fix build with gcc-6
In-Reply-To: <20160912192324.23682-2-s.martin49@gmail.com>
References: <20160912192324.23682-1-s.martin49@gmail.com>
 <20160912192324.23682-2-s.martin49@gmail.com>
Message-ID: <20161015122407.58376bf9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Sep 2016 21:23:23 +0200, Samuel Martin wrote:
> Add patch fixing/adding explicit cast on negative value in char[], which
> is required with gcc-6 (see "Narrowing conversions" paragraph in [1])
> 
> Fixes:
>   http://autobuild.buildroot.net/results/d0c/d0cd11163753db69a14c02e941dbda40e5f98bba/
> 
> [1] https://gcc.gnu.org/gcc-6/porting_to.html
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  .../0002-urg-gcc6-fix-narrowing-conversion.patch   | 99 ++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 package/urg/0002-urg-gcc6-fix-narrowing-conversion.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
