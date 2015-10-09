From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 15:25:14 +0200
Subject: [Buildroot] [PATCH 1/2] collectd: drop rrdtool selects
In-Reply-To: <1444330860-31735-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444330860-31735-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151009152514.06efee88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  8 Oct 2015 16:00:59 -0300, Gustavo Zacarias wrote:
> Drop indirect rrdtool selects, they're already selected by rrdtool
> itself so there's no need.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/collectd/Config.in | 4 ----
>  1 file changed, 4 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
