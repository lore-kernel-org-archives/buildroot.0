From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Wed, 14 Jul 2010 13:28:10 +0100
Subject: [Buildroot] [PATCH/RFC] Download sources from Git (and more)
In-Reply-To: <20100713200820.1a5fcc60@surf>
References: <1278970252-23007-1-git-send-email-luca@lucaceresoli.net>
	<1279032219.2887.78.camel@dubciaranr1.verifone.com>
	<20100713200820.1a5fcc60@surf>
Message-ID: <1279110490.7058.155.camel@cabbage.rehill.info>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2010-07-13 at 20:08 +0200, Thomas Petazzoni wrote:
> I understand this need: use Buildroot not only as an integration system
> to produce the final system, but also during the development of the
> application. For the moment, our recommended practice for this is to
> work on the application outside of Buildroot, as Buildroot is not
> well-suited for doing this.
> 
> Adding such a capability to Buildroot requires a fairly wide
> brainstorming and discussion to propose a global design that solves
> this question. What do we want to achieve ? What is the exact use
> case ? How all development steps are going to work ?
> 
> For that reason, I think Maxime's patch is saner: it adds the simple
> capability of downloading a package from GIT/SVN, without changing the
> existing Buildroot workflow.

A combination of the best of the two may be the way to go.

> I'm really open to changing the Buildroot workflow, but:
> 
>  1. I think it requires a much more detailed discussion about *what* we
>     need and then *how* we implement it.
> 
>  2. I'd prefer to do such major changes once the Buildroot cleanup
>     phase (started in January 2009) is more or less completed, so that
>     we start with a Buildroot from which we are satisfied in terms of
>     quality before starting adding major features such as turning
>     Buildroot into a development system and not only an integration
>     system. I think it's more important to make Buildroot work properly
>     with the feature-set we have today than having dozens of
>     half-thought features.
> 
> As such a change wouldn't probably occur before 2010.08, I'd prefer to
> have a solution similar to Maxime's merged into the tree for the
> moment, and having someone seriously starting the discussion on the
> Buildroot future as a development system.
> 

Understood; that's perfectly reasonable.  The amount of work going into
this project these days in phenomenal.  It is already a great tool but
the cleanup should make it all the more accessible.

I don't mind doing some throwaway work in the meantime in order to spark
some discussion on the points you raised above.

> Best regards,
> 
> Thomas

BTW, I hope I'm not stepping on toes by commenting here on this topic.
I'm eager to get something working but I realise there are many here
that have much greater oversight on what's needed.
