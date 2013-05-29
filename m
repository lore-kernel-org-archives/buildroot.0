From: Carlo Rajko <carlo.rajko@scen.it>
Date: Wed, 29 May 2013 17:15:50 +0200
Subject: [Buildroot] AT91SAM9G20-EK and aplay
In-Reply-To: <51A4E31C.7060707@mind.be>
References: <519F186B.3060606@scen.it> <20130524100520.01c518fd@skate>
 <519F2CDB.8080805@scen.it> <20130524112355.70d1cc53@skate>
 <519F452D.4070505@scen.it> <519F6226.4060002@zacarias.com.ar>
 <51A31366.4060405@scen.it> <20130527111602.6a8150b7@skate>
 <51A3355D.3070209@scen.it> <51A4E31C.7060707@mind.be>
Message-ID: <51A61BA6.6070601@scen.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 28/05/2013 19:02, Arnout Vandecappelle ha scritto:
> On 27/05/13 12:28, Carlo Rajko wrote:
>> Il 27/05/2013 11:16, Thomas Petazzoni ha scritto:
>>> Dear Carlo Rajko,
>>>
>>> On Mon, 27 May 2013 10:03:50 +0200, Carlo Rajko wrote:
>>>
>>>>> Actually it's the toolchain, seems CS 2012.03 isn't emitting proper
>>>>> arm926ej-s code.
>>>>> I've managed to reproduce it with the qemu_arm_versatile sample
>>>>> configuration and adding a bunch of packages (mpg123, vorbis-tools,
>>>>> ...)
>>>>> It did strike me as odd that i've got the same failures as yours
>>>>> (aplay,
>>>>> mpg123) but ogg123 worked fine with alsa output.
>>>>> So switching to an internal toolchain or CS 2011.09 magically fixed
>>>>> the
>>>>> issues.
>>>>
>>>> I switch to CS 2011.09 and now is ok, thanks.
>>>
>>> It's a problem worth reporting to Mentor Graphics, IMO.
>>>
>>> Even though I doubt anything will happen, last time I reported a bug,
>>> nothing really happened, unfortunately.
>>
>> I'll try with the new version 2013.05, just available in the package
>> buildroot, maybe the problem is already solved.
> 
>  We should probably blacklist the failing CS toolchains for the
> arm926ej-s, then.

I tried version CS 2013.05 successfully for my problem.
But there could be other hidden problems

Regards,
Carlo
