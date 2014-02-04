From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Tue, 4 Feb 2014 21:33:26 +0100
Subject: [Buildroot] [PATCH] defconfigs: add sama5d3 support
In-Reply-To: <52F11B35.7000707@mind.be>
References: <1391093726-7569-1-git-send-email-ludovic.desroches@atmel.com>
 <87y51rl01m.fsf@dell.be.48ers.dk>
 <20140204112654.GD30185@ldesroches-Latitude-E6320>
 <87zjm7cae2.fsf@dell.be.48ers.dk>
 <20140204132117.GE30185@ldesroches-Latitude-E6320>
 <87zjm75533.fsf@dell.be.48ers.dk> <52F11B35.7000707@mind.be>
Message-ID: <20140204203326.GB21958@ldesroches-Latitude-E6320>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 04, 2014 at 05:54:13PM +0100, Arnout Vandecappelle wrote:
> On 04/02/14 15:24, Peter Korsgaard wrote:
> >>>>>> "Ludovic" == Ludovic Desroches <ludovic.desroches@atmel.com> writes:
> > 
> > Hi,
> > 
> >  > I understand this point of view and I am fine with it. But my concern
> >  > is that some customers want something working out of the box. For
> >  > instance, we often use devmem2 for debugging purpose or other tools
> >  > such as i2c-tools. It is easier for us to have it in a defconfig
> >  > file.
> > 
> >  > I am not trying to convince you to take this defconfig as is! Just to
> >  > know if there is a way to provide specific packages? If not, it will
> >  > be provided only in our buildroot-at91 repository. I am also fine
> >  > with this, if the customer wants something out of the box then he'll
> >  > have to use our repository. Otherwise he could use buildroot one.
> > 
> > I understand. We're been discussing something like this a few times
> > (E.G. full blown "demo" defconfigs), but for now I prefer to keep the
> > variant in buildroot minimal.
> 
>  However, we are OK with a minimal and a demo variant. So you can submit
> one patch that builds a minimal config in configs/sama5d3_defconfig, and
> a second patch that adds a demo defconfig in
> configs/sama5d3_demo_multimedia_defconfig (it looks like you mainly add
> multimedia packages, hence the name I chose, but you can take something
> else of course).
> 

Once other components would be ready, I'll send a minimal defconfig and
a demo defconfig then I let you choose if you want to take both or not.

Regards

Ludovic
