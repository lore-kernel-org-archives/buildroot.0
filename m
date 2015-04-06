From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 10:59:03 +0200
Subject: [Buildroot] [PATCH] jsoncpp: don't build tests
In-Reply-To: <deb5dd93e84879ae624f214bf7dba983fa526348.1428298327.git.baruch@tkos.co.il>
References: <deb5dd93e84879ae624f214bf7dba983fa526348.1428298327.git.baruch@tkos.co.il>
Message-ID: <20150406105903.47b90b4e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon,  6 Apr 2015 08:32:07 +0300, Baruch Siach wrote:
> Fixes:
> http://autobuild.buildroot.net/results/a0f/a0f60a1df243bdae875f12668011a53a70071ee6/
> http://autobuild.buildroot.net/results/f88/f8885520b5892d49164c88a974e7dffc1c3c2ce0/
> http://autobuild.buildroot.net/results/448/448745830f58496e6dcdf48e2ad57650b4744909/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/jsoncpp/jsoncpp.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
