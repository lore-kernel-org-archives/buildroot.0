From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 24 Jul 2009 17:16:30 +0200
Subject: [Buildroot] Write Access to buildroot?
In-Reply-To: <20090724152448.4d1f5934@surf>
References: <4A689265.6030308@atmel.com>
	<87skgmwm6h.fsf@macbook.be.48ers.dk>	<4A69741A.8010903@atmel.com>	<20090724085603.GL13236@buzzloop.caiaq.de>	<9E543F22BF68405185D6B77291E4E5EF@aeglos>	<20090724121641.2c4cf8bd@surf>
	<4A699CDD.7060703@atmel.com> <20090724152448.4d1f5934@surf>
Message-ID: <4A69D04E.9040408@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni skrev:
> [ Keeping the list in Cc: since these things should probably be
>   discussed publicly. ]
>
> Le Fri, 24 Jul 2009 13:37:01 +0200,
> Ulf Samuelsson <ulf.samuelsson@atmel.com> a ?crit :
>
>   
>> With read access only, allowing you to make your own tree from the
>> main tree.
>> If you want to share your stuff, before committing to the main tree,
>> you have to do it outside the buildroot world.
>> Am I missing something?
>>     
>
> Yes you're missing something.
>
> Look at http://git.buildroot.net/
>
> You have a link to the official Buildroot Git tree, browsable at
> http://git.buildroot.net/buildroot/. This Git tree is read-only, except
> for Peter.
>
> But at the bottom of the page, you have ? User repositories ?. These
> are read/write for their owner. For example, mine is
> http://git.buildroot.net/~tpetazzoni/git/buildroot/. In my own
> repository, I have a master branch which is just a clone of the main
> Buildroot repository. And all the other branches (presently
> directfb-bump, ext-toolchain-target-path, external-toolchain,
> kconfig-update and xorg) contain my *own* work, ready for submission to
> Peter. And some of this work has actually already been integrated in
> mainline (branches directfb-bump, ext-toolchain-target-path and
> external-toolchain).
>
> The link
> http://lists.busybox.net/pipermail/buildroot/2009-March/026875.html
> that I've already posted explains how to use these user repositories,
> that *are read/write.
>
> Does that clarify the situation ?
>
>   
And what I am missing, is a way to have several people commit to the
same tree.
I.E: A development tree.

> Sincerly,
>
> Thomas
>   
BR
Ulf Samuelsson
