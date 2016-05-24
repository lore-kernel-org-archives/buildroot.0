From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 20:44:40 +0200
Subject: [Buildroot] [PATCH] Config.in: Use CDN kernel.org mirror
In-Reply-To: <1464017813-22503-1-git-send-email-abrodkin@synopsys.com>
References: <1464017813-22503-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20160524204440.6f9dd0e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 May 2016 18:36:53 +0300, Alexey Brodkin wrote:
> It turned out for quite some time CDN-powered mirror
> of kernel.org is available. See this announce:
> https://www.kernel.org/introducing-fastly-cdn.html
> 
> This change switches to that faster mirror by default.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Config.in | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to next after slightly tweaking the help text, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
