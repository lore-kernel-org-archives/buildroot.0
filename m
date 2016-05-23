From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 23 May 2016 17:21:24 +0000
Subject: [Buildroot] [PATCH] Config.in: Use CDN kernel.org mirror
In-Reply-To: <20160523191858.6b3e878c@free-electrons.com>
References: <1464017813-22503-1-git-send-email-abrodkin@synopsys.com>
 <20160523174643.777faf11@free-electrons.com>
 <1464019414.7749.8.camel@synopsys.com>
 <20160523191858.6b3e878c@free-electrons.com>
Message-ID: <1464024053.7749.21.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2016-05-23 at 19:18 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 23 May 2016 16:04:05 +0000, Alexey Brodkin wrote:
> 
> > 
> > > 
> > > > 
> > > > ?	?????http://www.XX.kernel.org/pub (XX = country code)
> > > > ?	?????http://mirror.aarnet.edu.au/pub/ftp.kernel.org??
> > > Should this list of mirrors be removed???
> > Well I have no preference here.
> > I mean user still may have a preferred mirror so why would we
> > limit him or her here?
> Well, if we're pointing to a CDN then really there is no longer any
> reason to point users to www.XXX.kernel.org with XX = country code,
> since that's what a CDN is doing automatically.

Indeed but given our previous discussion it makes sense to leave those
help strings for time being.

> > 
> > > 
> > > > 
> > > > +	??Now when kernel.org is mirrored by CDN as well we'll be using
> > > > +	??it by default to speed-up downloads all over the world.??
> > > I'm sorry, but I don't understand this sentence.??
> > If I'm not mistaken CDN allows to use the best server for each user
> > (based on some criteria). Now kerenl.org is mirrored with use of that
> > technology. And in theory users of Buildroot all over the world will
> > benefit from much faster downloads from this CDN mirror (which will
> > be in real life different physical servers for different users).
> Yes, of course. But I still think the wording is wrong. The wording
> feels like something for the commit log, not for the help text. A
> correct wording for the help text could be:
> 
> 	The default value points to kernel.org's CDN, which will
> 	automatically redirect you to a mirror geographically close to
> 	you.

Do you want me to resend the patch or you'll do this fixup before
patch application?

-Alexey
