From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 29 Sep 2014 11:12:09 +0100
Subject: [Buildroot] [PATCH 2/4] package/freerdp: can not build on uClibc
In-Reply-To: <87lhp3sara.fsf@dell.be.48ers.dk>
References: <cover.1411921550.git.yann.morin.1998@free.fr>
 <62743afc9fb2eb079bd1a3ff32ebfbf911fd1e16.1411921550.git.yann.morin.1998@free.fr>
 <87lhp3sara.fsf@dell.be.48ers.dk>
Message-ID: <54293079.5010507@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/28/2014 10:20 PM, Peter Korsgaard wrote:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
>   > FreeRDP uses eventfd_{read,write}, which is not supported in uClibc.
>   > Fixes:
>   >     http://autobuild.buildroot.net/results/ad7/ad7ade4c436d21cba930f40c613870fbadec840e/
>   >     http://autobuild.buildroot.net/results/5a3/5a30aecbb426f76a22e8285931a0a8cd59b5e70b/
>   >     http://autobuild.buildroot.net/results/6e0/6e0de0538e95ae156f7d2ad6eede46e44be81c8e/
>   >     [...]
>
>   > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
>   > ---
>   > Note: although we depend on !uClibc, we still comment about glibc or
>   > musl, because we currently do not have a documented way for negative
>   > dependencies.
>
> Committed, thanks.
>

Dear Peter,

I sent this patch 5 days ago to add support for uClibc for this package 
by applying an upstream patch:

http://patchwork.ozlabs.org/patch/392966/

Please, take it into consideration. I think it's better to fix the 
package instead of disabling it.

Thanks,
-- 
Vincent
