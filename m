From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 21:52:37 +0200
Subject: [Buildroot] [PATCH] openswan: needs host-flex
In-Reply-To: <1405945216-16901-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405945216-16901-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140721215237.71760f2c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 21 Jul 2014 09:20:16 -0300, Gustavo Zacarias wrote:
> Although parser.l is shipped it seems it might get regenerated from
> parser.y sometimes and an old installed flex might not be good enough.
> Fixes:
> http://autobuild.buildroot.net/results/e59/e5970eae28d01503d89a5d4e593711d7a27da8b5/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/openswan/openswan.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
