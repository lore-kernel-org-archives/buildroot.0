From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Jun 2015 14:53:35 +0200
Subject: [Buildroot] [PATCH] sysstat: fix hash
In-Reply-To: <1434197969-7255-1-git-send-email-gustavo@zacarias.com.ar>
References: <1434197969-7255-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150613145335.6becbbbc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 13 Jun 2015 09:19:29 -0300, Gustavo Zacarias wrote:
> Fix brainfail: mixed hash from dev and stable versions.
> Fixes:
> http://autobuild.buildroot.net/results/bdc/bdce55b88a4aaff82ce0a492a0a4f49ab5b9031b/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/sysstat/sysstat.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
