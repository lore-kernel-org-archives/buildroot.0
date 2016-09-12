From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 22:41:43 +0200
Subject: [Buildroot] [PATCH 2/3] package/urg: fix build with gcc-6
In-Reply-To: <20160912192324.23682-2-s.martin49@gmail.com>
References: <20160912192324.23682-1-s.martin49@gmail.com>
 <20160912192324.23682-2-s.martin49@gmail.com>
Message-ID: <20160912224143.06cec550@free-electrons.com>
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

I don't see this patch in patchwork. Did you remove it from patchwork
somehow ? Or was patchwork confused by something in your patch ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
