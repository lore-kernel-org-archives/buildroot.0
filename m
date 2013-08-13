From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 11:49:53 +0200
Subject: [Buildroot] [PATCH] opencv: gtk support doesn't work with
 directfb
In-Reply-To: <1376313332-5953-1-git-send-email-gustavo@zacarias.com.ar>
References: <1376313332-5953-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130813114953.23b66614@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 12 Aug 2013 10:15:32 -0300, Gustavo Zacarias wrote:
> This was dropped on 4b3d949b8af240bda451b0a4e57d60153188c2e4 when
> libgkt2 was updated. Fixes:
> http://autobuild.buildroot.net/results/817/8173b7fd3d6af79a7f2c04bf36059a4429127516/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/opencv/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
