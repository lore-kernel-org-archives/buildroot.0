From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Apr 2017 10:42:11 +0200
Subject: [Buildroot] [PATCH] phytool: add kernel headers dependency
In-Reply-To: <20170415181904.5193-1-yegorslists@googlemail.com>
References: <20170415181904.5193-1-yegorslists@googlemail.com>
Message-ID: <20170416104211.1e237068@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Apr 2017 20:19:04 +0200, Yegor Yefremov wrote:
> phytool includes linux/mdio.h, that is available since
> kernel 3.7. So add related dependency.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e0e/e0eebcb9a694cd5d4c76c40e5dba971e3ac9d7c5/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/phytool/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
