From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 20:16:00 +0200
Subject: [Buildroot] [PATCH] ushare: fix build with NLS support
In-Reply-To: <1474380014-20249-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1474380014-20249-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160920201600.31d99edd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Sep 2016 19:30:14 +0530, Rahul Bedarkar wrote:
> Add patch to fix build errors when NLS support is enabled.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/19d/19d67dd43e5a313c77e4be97ecb9811ffa52f797/
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  ...e-config-h-before-checking-for-CONFIG-NLS.patch | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/ushare/0003-ushare-c-include-config-h-before-checking-for-CONFIG-NLS.patch

Applied to master, thanks. Please submit the patch to the upstream
ushare project. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
