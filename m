From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 09:32:11 +0100
Subject: [Buildroot] [PATCH] python-jaraco-classes: add missing
 dependency
In-Reply-To: <20171127063354.4901-1-yegorslists@googlemail.com>
References: <20171127063354.4901-1-yegorslists@googlemail.com>
Message-ID: <20171127093211.6e66c74e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Nov 2017 07:33:54 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> python-jaraco-classes needs host-python-setuptools-scm.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3a7000002b86663a56c0341d192f131a4a8f4936
> http://autobuild.buildroot.net/results/553d6fdeb6ea5359b1c7d4eeb844da7a588f02e7
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-jaraco-classes/python-jaraco-classes.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
