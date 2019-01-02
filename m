From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Jan 2019 13:50:06 +0100
Subject: [Buildroot] [PATCH v2 0/4] Support Linux 4.20
In-Reply-To: <877efnpa7x.fsf@dell.be.48ers.dk>
References: <20181231175234.14572-1-thomas.petazzoni@bootlin.com>
 <87sgycox9n.fsf@dell.be.48ers.dk>
 <20190102091647.319e2c96@windsurf>
 <877efnpa7x.fsf@dell.be.48ers.dk>
Message-ID: <20190102135006.22f4f096@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 02 Jan 2019 12:31:14 +0100, Peter Korsgaard wrote:

>  > Yes, that probably make sense. But in this case, we would need to get
>  > in touch with the kernel folks to get the net_tstamp.h fix in -stable.
>  > It has the Fixes: tag, but it still hasn't been backported to
>  > 4.19-stable.  
> 
> Ok. The last few 4.19.x releases did not contain any net/ fixes, perhaps
> that will fixed now the holidays are over.

Ah, yes, it's true that for net/ stuff, having the Fixes: tag doesn't
automatically backport the patch, davem wants to have a manual look at
each and every net/ patch that goes into stable.

> If not, will you take care of it?

I looked up the e-mails archives, and on December 18, when davem
applied the patch, he said:

  Applied and queued up for -stable, thanks.

So I suppose it will land in stable at some point.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
