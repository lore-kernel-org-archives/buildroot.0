From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Mar 2014 11:48:11 +0200
Subject: [Buildroot] [PATCH 1/1] libubox: Lua binding needs mmu and fix
 coding style
In-Reply-To: <1396150681-16655-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1396150681-16655-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <20140330114811.36dc6247@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hadrien Boutteville,

On Sun, 30 Mar 2014 05:38:01 +0200, Hadrien Boutteville wrote:
> Fixes
> http://autobuild.buildroot.net/results/4e1/4e112e4463fef7ad8757259b222fab10fbd09d0d/
> 
> The Lua binding option of libubox uses fork() so it needs the MMU.
> 
> By the way, correction of coding style as stated in the buildroot
> manual.
> 
> Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
> ---
>  package/libubox/libubox.mk | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
