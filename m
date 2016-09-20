From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 20:21:10 +0200
Subject: [Buildroot] [PATCH] uclibc: add upstream patch to fix glog
 build on bfin
In-Reply-To: <1474392814-20316-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1474392814-20316-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160920202110.1a0bda07@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Sep 2016 23:03:34 +0530, Rahul Bedarkar wrote:
> glog has been failing on bfin because of issue in uclibc which is now
> fixed in upstream.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/a10/a10ed48e6eb8411a3d8372f57c05fd11130da0e0/
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  ...-dsbt-.h-avoid-void-pointer-s-subtraction.patch | 70 ++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 package/uclibc/0004-elf-fdpic-dsbt-.h-avoid-void-pointer-s-subtraction.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
