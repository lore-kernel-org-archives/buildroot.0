From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 22:00:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/liquid-dsp: fix build failure
 on powerpc64le
In-Reply-To: <43a99fffd93addae12dc5d31342896ebe09a613e.1480908655.git.sam.bobroff@au1.ibm.com>
References: <43a99fffd93addae12dc5d31342896ebe09a613e.1480908655.git.sam.bobroff@au1.ibm.com>
Message-ID: <20161205220021.6b9b383b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Dec 2016 14:30:57 +1100, Sam Bobroff wrote:
> Commit 7d435d8510db69ed2f9108abaa52479bce127b72 fixed building on
> powerpc and powerpc64. This extends that fix to cover powerpc64le,
> which suffers from the same problem.
> 
> Fixes:
> http://autobuild.buildroot.net/results/45c4651a833e4667d4ef68e619cf4b5749a288da
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
