From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Dec 2014 14:56:38 +0100
Subject: [Buildroot] [PATCH] liblinear: needs C++
In-Reply-To: <6dade243be7400bc9321485065203557498387bb.1419237190.git.baruch@tkos.co.il>
References: <6dade243be7400bc9321485065203557498387bb.1419237190.git.baruch@tkos.co.il>
Message-ID: <20141222145638.547fb1e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 22 Dec 2014 10:33:10 +0200, Baruch Siach wrote:
> Fixes:
> http://autobuild.buildroot.net/results/1be/1be890ece519ebc0d0ff4f3f31abc06eb0b7356c/
> http://autobuild.buildroot.net/results/f59/f59e0fade9dbf851cfee5f82751390df87706e6a/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/liblinear/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Sorry, too late I already committed
http://git.buildroot.net/buildroot/commit/?id=a20c15f1812ef50aa63bf050a604012db370bc14
earlier today.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
