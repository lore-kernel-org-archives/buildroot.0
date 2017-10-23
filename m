From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 23 Oct 2017 00:31:52 -0200
Subject: [Buildroot] [next v2 1/7] testing/infra/builder: split
 configure() from build()
References: <fb667fe0-7577-9d7b-5b7a-5e293d31a1c2@mind.be>
Message-ID: <59ed549833d61_5e463fc3ac91a5dc183d4@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Oct 06, 2017 at 05:31 PM, Arnout Vandecappelle wrote:

> from: Arnout Vandecappelle <arnout@mind.be>
> date: Fri, Oct 06 10:31 PM +02:00 2017
> to: Ricardo Martincoski <ricardo.martincoski@gmail.com>, buildroot at buildroot.org
> cc: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> subject: Re: [Buildroot] [next v2 1/7] testing/infra/builder: split configure() from build()
> 
>  I believe you might respin this series soonish, so time to review it :-)

Thank you very much for reviewing the series.
Sorry for the long delay.

> 
>  BTW, when you do respin, could you push it to a gitlab clone, trigger the
> build, and report the result in your cover letter?

Sure. I will do.

> 
> On 27-08-17 00:20, Ricardo Martincoski wrote:
[snip]
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

The only reason I won't keep it is because the rebase is not trivial (automatic)
after I add the new patch "call make with empty env" to the beginning of the
series.

>  It would be nice though to have an example of its use earlier in the series.

It will have a use (but not a complete example) when I add the new patch "split
runtime test from BRTest"

Regards,
Ricardo
