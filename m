From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 13:54:59 +0100
Subject: [Buildroot] [PATCH] directfb: remove cle266 and unichrome
 support
In-Reply-To: <1450615477-11659-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1450615477-11659-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20151220135459.673aa46e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear gustavo.zacarias at free-electrons.com,

On Sun, 20 Dec 2015 09:44:37 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> They're broken for the latest version and directfb upstream is gone.
> 
> cle266 is an old chipset for AMD K7 (32 bit) athlons with integrated
> graphics - very odd hardware.
> 
> unichrome is another VIA graphics standalone chip/chipset used for some
> odd video cards and VIA CPUs (x86-based: C7, Nano and so on).
> 
> Add options to legacy as well. Fixes:
> 
> http://autobuild.buildroot.net/results/ab9/ab9a6dd044b5f3e8e42629a2aaf598fd0e0357ed/
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  Config.in.legacy             | 16 ++++++++++++++++
>  package/directfb/Config.in   | 10 ----------
>  package/directfb/directfb.mk |  2 --
>  3 files changed, 16 insertions(+), 12 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
