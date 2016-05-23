From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 23 May 2016 16:11:14 +0000
Subject: [Buildroot] [PATCH] Config.in: Use CDN kernel.org mirror
In-Reply-To: <20160523180451.73efcf39@free-electrons.com>
References: <1464017813-22503-1-git-send-email-abrodkin@synopsys.com>
 <20160523174643.777faf11@free-electrons.com>
 <87bn3wepiq.fsf@dell.be.48ers.dk>
 <20160523180451.73efcf39@free-electrons.com>
Message-ID: <1464019843.7749.12.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2016-05-23 at 18:04 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 23 May 2016 17:57:01 +0200, Peter Korsgaard wrote:
> 
> > 
> > ?> Should this list of mirrors be removed???
> > 
> > Does it even make sense to have a configuration option for it if the CDN
> > is used?
> I asked the exact same question when a person came on IRC to suggest
> this change. I referred to what we did for the SourceForge situation.
> 
> But apparently, this CDN thing is less smart than the SourceForge thing
> in that it might redirect you to a non-working mirror (i.e it doesn't
> check).
> 
> However, the person on IRC was also suggesting to do the change for
> BR2_GNU_MIRROR, so maybe the case is different.
> 
> So, I would suggest to change the default values for now, leave it this
> way for a while, and if nobody complains of failed downloads, we can
> remove the option completely.

Agree only real life test may answer how reliable that thing is.
But given there's an obvious benefit for users and current BR state
we'll have plenty of time to try this out and if people start complaining
we'll revert back to a simple www.kernel.org?before the next rc1.

-Alexey
