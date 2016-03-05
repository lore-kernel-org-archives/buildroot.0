From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:17:29 +0100
Subject: [Buildroot] [PATCH] slang: fix static link with ncurses
In-Reply-To: <4aa51349a8c68f15bfc5ba169eeea9c6e9959128.1456834855.git.baruch@tkos.co.il>
References: <4aa51349a8c68f15bfc5ba169eeea9c6e9959128.1456834855.git.baruch@tkos.co.il>
Message-ID: <20160305151729.66a74f70@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue,  1 Mar 2016 14:20:55 +0200, Baruch Siach wrote:
> slang does forgets ncurses that is a dependency of readline when linking the
> slsh binary. Correct this.
> 
> While at it, also make sure to use staging ncurses5-config script and not the
> host one.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1dc/1dc52048254c32a24070fef1c1039cebb32e7ac1/
> http://autobuild.buildroot.net/results/c17/c176511cbb147c2d8cb0ec0ff3c1612ce8971cb8/
> http://autobuild.buildroot.net/results/78d/78dc2ba07b1d7f888aab94e223f3e0b1a1df3af5/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/slang/slang.mk | 4 ++++
>  1 file changed, 4 insertions(+)

I've marked this patch as Superseded in patchwork, as I believe it was
superseded by your patch "[PATCH] slang: fix static link with
readline", even though the title has changed and v2 was not indicated.

Let me know if this isn't correct.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
