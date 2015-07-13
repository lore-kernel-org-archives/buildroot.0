From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 22:25:33 +0200
Subject: [Buildroot] [PATCH] zeromq: Remove useless space
In-Reply-To: <1436814745-21624-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436814745-21624-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150713222533.38d4d40f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Mon, 13 Jul 2015 21:12:25 +0200, Maxime Hadjinlian wrote:
> Be coherent with all the other ifeq check where there's no space.
> From the doc of Make, it should not cause any trouble, but coherence has
> its own merit.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/zeromq/zeromq.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
