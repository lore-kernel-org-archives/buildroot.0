From: hartleys <hartleys@visionengravers.com>
Date: Wed, 20 Aug 2008 12:09:05 -0400
Subject: [Buildroot] Patch files with Makefile.autotools.in
In-Reply-To: <20080820102205.5eac84b8@atmel.com>
References: <BD79186B4FD85F4B8E60E381CAEE19096D931D@mi8nycmail19.Mi8.com><20080819075608.54c5d9c7@atmel.com><BD79186B4FD85F4B8E60E381CAEE19096D9982@mi8nycmail19.Mi8.com><20080820090529.649c4477@atmel.com><20080820080327.GB19268@mx.loc>
	<20080820102205.5eac84b8@atmel.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19096D9B1D@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wednesday, August 20, 2008 1:22 AM, Bernhard Reutner-Fischer wrote:
>> On Wed, Aug 20, 2008 at 09:05:29AM +0200, Hans-Christian Egtvedt
>> wrote:
>
> <snippy custom package patching when using Makefile.autotools.in>
>
>>> I'll do a mental note of the problem, it is likely to show up in the

>>> future as well.
>> 
>> heh, that was exactly the reason why i added that nice FIXME in the 
>> first place ;)
>> 
>
> It was more inside my brain, actually looking into it at some
time(tm).
>
>> What secret package is this about anyway? If it's of general use, it 
>> should be added to the tree..
>>
>
> Agreed (-:

Nothing secret. It's the ESE Key Daemon
http://www.burghardt.pl/2007/12/ese-key-daemon/. I posted a question
about it last week and had no response so figured nobody was interested.
I actually see that a lot on the list when "non-buildroot" packages are
named in the subject. Oh well...

I've been communicating with the developer, Krzysztof Burghardt, trying
to fix a problem with the make when cross compiling. He has sent me a
patch to try and I couldn't get it applied through the normal
Makefile.autotools.in route. Hence this email...

I've basically hijacked the packages/customize directory for stuff I'm
playing with outside of the normal buildroot packages. That way if I
have a problem it's a quick mental note to not bother the list about it.
But, if this package is of any use to the group I'm more than willing to
submit it. I just need to test Krzysztof's patch first.

Thanks for the replies,
Hartley Sweeten
