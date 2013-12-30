From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Dec 2013 00:07:30 +0100
Subject: [Buildroot] [PATCH] gstreamer: fix xtensa configure
In-Reply-To: <c86637e25b88581c012c8032b8a9b54cf78881c3.1388398832.git.baruch@tkos.co.il>
References: <c86637e25b88581c012c8032b8a9b54cf78881c3.1388398832.git.baruch@tkos.co.il>
Message-ID: <20131231000730.1e6a2182@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 30 Dec 2013 12:20:32 +0200, Baruch Siach wrote:
> Disable unaligned access to avoid configure run test.
> 
> Fixes
> http://autobuild.buildroot.net/results/a0c/a0cca019b0b2f33b6c2be17e5a44a807bbb4dac1/.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/gstreamer/gstreamer/gstreamer.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
