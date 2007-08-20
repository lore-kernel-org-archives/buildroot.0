From: Brad House <brad@mainstreetsoftworks.com>
Date: Mon, 20 Aug 2007 08:09:42 -0400
Subject: [Buildroot]
	svn	commit:	trunk/buildroot/target/device/Soekris/net4801
In-Reply-To: <1187588089.31921.67.camel@elrond.sweden.atmel.com>
References: <20070819210930.1D668A60EF@busybox.net>	
	<46C8F332.2000001@mainstreetsoftworks.com>
	<1187588089.31921.67.camel@elrond.sweden.atmel.com>
Message-ID: <46C98486.3070105@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>> Log:
>>> UPdate Soekris Linux config to 2.6.22.1
>>>
>>> Modified:
>>>    trunk/buildroot/target/device/Soekris/net4801/linux26.config
>>>
>> Thanks for committing that update... Any reason the other part of
>> my patch didn't make it (mainly the removal of the busybox and uclibc
>> configs)?
>>
> 
> Yes, I can't judge the consequences of that action.
> That does not mean that the proposed patch is rejected.
> Just that I will not do it.
> 
> Are you related to the manufacturer of the H/W?
> 
> I will leave that decision to Someone Else(tm)
> 
> What I can do, is to add another x86 target, without those files...

No, I have no affiliation with soekris. My company is just looking at
them as a possible hardware vendor for our embedded application, and
I've been just submitting patches which fixed problems I've
encountered.  I guess my main motivation for having all the patches
committed is purely selfish as it's easier for them to be upstream
than maintaining an overlay patchset.  That said, I think others
could benefit.

Truthfully though, I can find no reason why they had a custom uclibc
or busybox config.  My system is up and running fine.  Perhaps whoever
submitted them to begin with wanted to slim down the system a bit, etc.
I doubt though that someone from Soekris was responsible for submitting
the patches, their website clearly states that they are only a hardware
company and not to ask for basically anything software related. That
combined with the fact I can't even get them to answer a few simple
questions about making a volume purchase [2-5k units] of _their_
hardware ... well, I don't know what to say about that, maybe it's
for the best though as I'd rather go ARM-based, just means we'd need
some custom hardware designed, which would slow our time-to-market
a bit...

-Brad
