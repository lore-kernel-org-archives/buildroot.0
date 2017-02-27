From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 21:37:57 +0100
Subject: [Buildroot] [PATCH] mplayer: not supported on or1k
In-Reply-To: <1488149043-15973-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488149043-15973-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170227213757.0a900016@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Feb 2017 23:44:03 +0100, Thomas Petazzoni wrote:
> MPlayer doesn't support OpenRISC:
> 
> The architecture of your CPU (or1k) is not supported by this configure script
> It seems nobody has ported MPlayer to your OS or CPU type yet.
> 
> so disable it on this architecture.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/47207dfd10ff6e5ec4ccdcf8454aaf5f408ad1e3/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/mplayer/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
