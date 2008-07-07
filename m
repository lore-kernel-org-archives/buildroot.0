From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 7 Jul 2008 19:33:36 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
References: <20080704222950.E76B63C61F@busybox.net><87fxqmg53j.fsf@macbook.be.48ers.dk>
	<48720878.3070602@atmel.com><20080707123642.GA15840@mx.loc>
	<487212CC.7020303@atmel.com><20080707131123.GC15840@mx.loc>
	<20080707132821.GE15840@mx.loc><48721DAA.3080900@atmel.com>
	<871w254ufq.fsf@macbook.be.48ers.dk>
Message-ID: <3E910904404F43C2BF43B92D95BCD1A4@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
> Ulf> Not if you want your log file to have the
> Ulf> same name as your project.
> 
> Ulf> Try typing
> Ulf> "make > atngw100-expanded-3.log 2>&1"
> Ulf> a couple of times, and you see what I mean.
> 
> Nothing stops you from defining an alias for make <whatever>_defconfig
> && make 2>&1 > <whatever>.log in your local .bashrc - What we question
> is the need for adding it to buildroot with the complications it adds
> elsewhere.

It does not add any complication, but it does highlight that
the autotools has a less desirable implementation.

> 
> And given the typical runtime of a buildroot compilation I doubt
> that the command length of the make invocation is the limiting factor
> in developer effeciency ;)
> 
> -- 
> Bye, Peter Korsgaard
>


Best Regards
Ulf Samuelsson 
