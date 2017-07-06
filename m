From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 21:28:30 +0200
Subject: [Buildroot] [PATCH] python-setproctitle: change setup type to
 setuptools
In-Reply-To: <20170706085259.14394-1-yegorslists@googlemail.com>
References: <20170706085259.14394-1-yegorslists@googlemail.com>
Message-ID: <20170706212830.6a1abb7d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Jul 2017 10:52:59 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Changing setup type to setuptools avoids installing as zipped .egg
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-setproctitle/python-setproctitle.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
