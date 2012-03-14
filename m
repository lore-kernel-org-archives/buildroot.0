From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Wed, 14 Mar 2012 11:42:23 +0100
Subject: [Buildroot] [PATCH] apply-patches.sh: use series file to apply
 patches in proper order
In-Reply-To: <20120314110417.1b120452@skate>
References: <CAHXCMMLOGDZ5g30OM+5dryn-5kAgtLeeB4R8UAYBfHW4VUC=MQ@mail.gmail.com>
 <1331233872-31746-1-git-send-email-ludovic.desroches@atmel.com>
 <CAHXCMMLWPp81PcHR17pEwEaPoWHLa5PnLZcTu=Lt7uCASXMEiw@mail.gmail.com>
 <20120312085752.GB444@game.jcrosoft.org> <4F5F4624.1000607@free.fr>
 <20120313212337.GE2725@ldesroches-Latitude-E6320>
 <20120314085935.GK444@game.jcrosoft.org>
 <4F606AF2.2010400@atmel.com> <20120314110417.1b120452@skate>
Message-ID: <20120314104223.GG2725@ldesroches-Latitude-E6320>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Mar 14, 2012 at 11:04:17AM +0100, Thomas Petazzoni wrote:
> Le Wed, 14 Mar 2012 10:54:58 +0100,
> Nicolas Ferre <nicolas.ferre@atmel.com> a ?crit :
> 
> > I would say: why?
> > 
> > This patch series has been discussed for months. Now we have the
> > discussion about using another external tool. It seems to me that this
> > discussion can easily go on top of current patch series which
> > currently does the job.
> > Please do not delay again a feature that we need and the enhancements
> > provided by Ludovic's patches. Yes quilt can be good, but it is a new
> > enhancement that can go on top of this work: provide a patch that adds
> > this quilt enabled feature and then, we can talk about:
> > - the relative benefit of your solution
> > - the opportunity to add another host tool dependency
> > - the amount of code touched by your enhancement
> > - etc.
> 
> I definitely agree with Nicolas here. Ludovic's set of patches have
> been around for months and months, and both Atmel and Armadeus need
> this feature. It would be great if we could make progress on this.
> Additional improvements can be done later (even though I'm personally
> not sure we want to depend on quilt).
> 

So what can I do to move forward?

I have sent my set of patches after having reworked it from Arnout advices.

I will send a new set with the patch discussed here in order to keep the patch
order of the series file if there is one.

Can I send it with your ack? Do you want me to test it with some specific
configurations? As I said, I tested my set of patches with an armadeus
configuration and with an atmel configuration using an archive with many
patches for the kernel.


Regards

Ludovic
