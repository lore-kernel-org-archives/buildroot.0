From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 15 Oct 2007 20:16:46 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
References: <20071012210141.1DF69A5E1B@busybox.net><0710131046500.9729@somehost><1192269439.26495.4.camel@elrond.atmel.sweden><0710131212520.9729@somehost><1192300638.26495.13.camel@elrond.atmel.sweden><0710132115250.9729@somehost><1192307460.26495.27.camel@elrond.atmel.sweden><0710132305350.9729@somehost><016c01c80ef8$e931c350$9900a8c0@atmel.com>
	<0710151840550.11188@somehost>
Message-ID: <00fd01c80f57$e71f2ad0$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>> I rather think this is a result of Bernhards patch to deprecate older
>> versions of Binutils, automatically changing an existing *working*
>> ".config" into something which might, or might not work after a "make
>> menuconfig".
>
> There you go again.  Don't waste your time throwing dirt on one another!
> Work together instead!  Learn from eachother.  Everyone will benefit.
> Life is short and then you die, both of you and your "customers".
>

It is not "throwing dirt", it is advice on where to look for your JPEG build 
problems.
I.E: Try an older version of binutils...

>> Build a toolchain that works, then use an external toolchain.
>> Saves you a lot of time...
>
> Yes.  Any FAQ on that?
> But still aspirine, workaround, substitute for the real thing :(

It takes 1-2 hours to build a toolchain.
It is not neccessary to repeat the process everytime you want to rebuild 
buildroot.
Look in the docs directory..

Best Regards
Ulf Samuelsson
