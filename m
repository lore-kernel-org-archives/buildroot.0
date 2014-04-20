From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 10:55:20 +0200
Subject: [Buildroot] [PATCH] jansson: needs math library
In-Reply-To: <1689aa2a424cf897e59956c16b850971c7a4b514.1397978559.git.baruch@tkos.co.il>
References: <1689aa2a424cf897e59956c16b850971c7a4b514.1397978559.git.baruch@tkos.co.il>
Message-ID: <20140420105520.3ac2fb43@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 20 Apr 2014 10:22:39 +0300, Baruch Siach wrote:
> libjansson.so doesn't list libm in its NEEDED header. Fixes the following
> nftables config time failure:
> 
> .../usr/lib/libjansson.so.4: undefined reference to `__isnan'
> .../usr/lib/libjansson.so.4: undefined reference to `__isinf'
> 
> Fixes:
> http://autobuild.buildroot.net/results/152/1525d7a3e1d1fcf35858962251c0b69a5e1b64db/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/jansson/jansson.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
