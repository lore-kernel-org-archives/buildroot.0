From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 17:18:56 +0200
Subject: [Buildroot] [PATCH 04/13] gcc: remove deprecated 4.7.x
In-Reply-To: <20161015145107.18264-5-arnout@mind.be>
References: <20161015145107.18264-1-arnout@mind.be>
 <20161015145107.18264-5-arnout@mind.be>
Message-ID: <20161015171856.7b6f00fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Oct 2016 16:50:58 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> We will remove BR2_DEPRECATED, so remove this deprecated option.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  Config.in.legacy                   |  7 +++++++
>  package/gcc/Config.in.host         | 23 -----------------------
>  package/gcc/gcc-final/gcc-final.mk | 12 ------------
>  package/uclibc/uclibc.mk           |  7 +++----
>  4 files changed, 10 insertions(+), 39 deletions(-)

This commit forgets to remove the gcc patches. It can be fixed when
applying, I don't think it's worth resending just for this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
