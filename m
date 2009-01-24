From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 24 Jan 2009 17:45:26 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/scripts:  test
In-Reply-To: <8763k4hqi6.fsf@macbook.be.48ers.dk>
References: <20090124112911.51B4E769CC@busybox.osuosl.org>
	<8763k4hqi6.fsf@macbook.be.48ers.dk>
Message-ID: <1232815526.5311.156.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2009-01-24 klockan 12:50 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-24 11:29:10 +0000 (Sat, 24 Jan 2009)
>  ulf> New Revision: 25005
> 
>  ulf> Log:
>  ulf> Add test configuration but do not include it by default
> 
>  ulf> Added:
>  ulf>    trunk/buildroot/scripts/test/
>  ulf>    trunk/buildroot/scripts/test/Config.in.test.buildall
> 
> Come on, just keep it locally instead if it isn't used by BR.
> 

You can say the same for all the defconfigs.
Buildroot does not use them unless you do a make *_defconfig

In the same way, a BR user will be able to do a test
of a specific board/architecture by running dedicated commands.

> What does this buy you compared to just having a .config with those
> things enabled?

It saves editing configs.
I can apply this to ANY board, without manual editing,
and there are a lot of boards/architectures.

By using several Config.in.test files, it is easy to 
test a limited set of things for many architectures.

> Please discuss these things on the list first when you know they are
> controversive.

I already suggested this on the list and got no response.

What is the benefit of NOT having selftest included?

?I have pointed out that so far we have no documentation 
on what works and what does not work.
If the results of running these scripts are checked in
then we *have* documentation which is generated automatically.

Do you have ANY way of measuring the quality of Buildroot
before you do a release, or do you just plan to 
tell everyone that we are creating a release 
and then take the trunk and publish it a certain date
regardless of quality?

BR
Ulf Samuelsson
