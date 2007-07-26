From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 26 Jul 2007 08:55:57 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
References: <20070725173927.E0BE0A5E25@busybox.net>
	<20070725223934.GB11697@aon.at>
	<1185407250.5580.17.camel@elrond.sweden.atmel.com>
	<6311fe0b0707251806x6e13d50dpefddd8ab6cc2a646@mail.gmail.com>
Message-ID: <00a401c7cf52$629f3f60$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> The SDL compile failed since "directfb.h" could not be found
>> so I made the assumption, that it was neccessary.
>> Maybe I was wrong, but if it is not required, why the error message?
>>
>>
>> > If you want directfb and directfb-support, the you should select it
>> > manually, no?
>>
>> Best Regards
>> Ulf Samuelsson
>>

> DirectFB is not required.
> SDL only needs the directfb.h header to build, in case directfb might be
> invoked later at run time.
> directfb is not used by default by SDL
> 
> 
> -Rex
> 

OK, so we need to download the DirectFB and install its headers.
SDL won't build in buildroot, unless we do.

Best Regards
Ulf Samuelsson
