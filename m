From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 08 Sep 2009 09:15:55 +0200
Subject: [Buildroot] [PATCH 1/5] Remove the "project" feature
In-Reply-To: <87hbvd52z7.fsf@macbook.be.48ers.dk>
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<a57f463ae7b50d932282ded660a431251e1de379.1252361088.git.thomas.petazzoni@free-electrons.com>
	<20090908082707.18e19d6e@hcegtvedt.norway.atmel.com>
	<1252393123.11390.5.camel@bender> <87hbvd52z7.fsf@macbook.be.48ers.dk>
Message-ID: <1252394155.13520.2.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2009-09-08 at 09:07 +0200, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> 
> Hi,
> 
>  >> I use it all the time ;) How do you propose building for multiple
>  >> targets? I would at least like to share the toolchain, preferably
>  >> also libraries.
> 
>  Sven> Same here. We don't currently use the project feature, but mostly
>  Sven> because we didn't find the time yet to try it. We are building
>  Sven> several targets for the same platform and currently we do a full
>  Sven> rebuild for each target, this includes the toolkit. If there was
>  Sven> an easy way to at least share the tool-chain, then I would
>  Sven> welcome if it wasn't removed from buildroot.
> 
> We have that already with the external toolchain support. I also don't
> use it yet (we're doing like you), but will start to use it soon.

So how would I go about reusing the buildroot supplied tool-chain for
multiple targets? I imagine that one basic target would build the
tool-chain and the other targets would then use that as their external
tool-chain? Could you give an example or a quick introduction on how to
set this up? Or just point me to the docs if I just missed that such
documentation exists. That would be much appreciated.


Sven
