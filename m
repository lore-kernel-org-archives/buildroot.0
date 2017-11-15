From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 15 Nov 2017 11:21:55 +0200
Subject: [Buildroot] [PATCH] iproute2: bump to version 4.14.1
In-Reply-To: <87wp2rlx3i.fsf@dell.be.48ers.dk>
References: <9307d429db0bf9d7d141aa49ddc2e72425460882.1510684057.git.baruch@tkos.co.il>
 <87wp2rlx3i.fsf@dell.be.48ers.dk>
Message-ID: <20171115092154.wkmktmstb5i7ujwc@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, Nov 15, 2017 at 10:17:37AM +0100, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > Remove uClibc build fix; current uClibc version defines the required
>  > macro.
> 
>  > Remove static link fix; fixed upstream.
> 
>  > Rebase the musl libc-compat.h workaround to adapt to upstream headers
>  > location change.
> 
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> I see that you didn't mark this as being for next. Is that on purpose?
> If so, why?

No purpose. I just thought it's obvious.

Would you prefer to have all patches for next marked in the subject prefix 
during the -rc period?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
