From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 20:29:37 +0200
Subject: [Buildroot] [PATCH] trinity: needs MMU support
In-Reply-To: <1474477991-17171-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1474477991-17171-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160921202937.050f414e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Sep 2016 22:43:11 +0530, Rahul Bedarkar wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/2fc/2fca707deb6fda2da83ab817f8e594f76415d997/
> 
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/trinity/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
