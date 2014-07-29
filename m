From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 23:40:33 +0200
Subject: [Buildroot] [PATCH] popt: now needs gettextize
In-Reply-To: <1406667806-25878-1-git-send-email-gustavo@zacarias.com.ar>
References: <1406667806-25878-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140729234033.72611bb9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 29 Jul 2014 18:03:26 -0300, Gustavo Zacarias wrote:
> Because of df9244ff3738face50605eacf4d4f15d963de915 we now need to
> gettextize popt. Fixes:
> http://autobuild.buildroot.net/results/6e2/6e27c98407f114df07eb5cd16a843420fdb72bf4/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/popt/popt.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
