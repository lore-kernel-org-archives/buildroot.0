From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Wed, 2 Oct 2019 10:31:11 +0000
Subject: [Buildroot] [PATCH v2 1/1] package/php-xdebug: new package
In-Reply-To: <9dff4753-bef6-231f-a224-63382b459dd6@mind.be>
References: <20190925114456.16388-1-nicolas.carrier@orolia.com>
 <f24884d9b449983b9630d2a5ab43823ec586affa.camel@orolia.com>
 <9dff4753-bef6-231f-a224-63382b459dd6@mind.be>
Message-ID: <966473127dcb48137fffcc704f3f0db5e0cfbddb.camel@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
Are there still some defects in this patch, preventing it from being
merged?
Thank you


On Wed, 2019-09-25 at 15:02 +0200, Arnout Vandecappelle wrote:
>  Hi Nicolas,
> 
> 
> On 25/09/2019 14:00, Nicolas Carrier wrote:
> > Hello,
> > I tried to address all your comments, but:
> [snip]
> >  * I didn't manage either to use check-package. I ran:
> >        $ ./utils/check-package package/php-xdebug/*
> >    _before_ fixing the two errors Arnout mentioned in the
> > Config.in,
> >    but just got:
> >        36 lines processed
> >        0 warnings generated
> 
>  Indeed, it looks like the checking of Config.in is more limited than
> I thought.
> I'll put it on my todo list :-)
> 
> 
>  Regards,
>  Arnout
> ATTENTION: This email came from an external source.
> Do not open attachments or click on links from unknown senders or
> unexpected emails.
