From: Atilla Filiz <atilla.filiz@gmail.com>
Date: Fri, 4 Aug 2017 19:03:02 +0200
Subject: [Buildroot] Howto handle fork of an existing package
In-Reply-To: <3712be4a-076a-25b1-2f46-e25acb31d856@mind.be>
References: <6947b9e4-bf6e-ace7-c8c9-e440a494e225@gmail.com>
 <20170804164145.21595c6d@windsurf.lan>
 <3712be4a-076a-25b1-2f46-e25acb31d856@mind.be>
Message-ID: <aa18960b-e64d-1af9-7bb6-1a1ae2c57fc9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/04/2017 06:41 PM, Arnout Vandecappelle wrote:
>
> On 04-08-17 16:41, Thomas Petazzoni wrote:
>>
>> 4. Contribute to the official wiringpi project instead of doing a fork,
>> so that a single project supports multiple platforms.
>   Tell that to the LeMaker people, not to Atilla. And while you're at it, tell
> the RaspberryPi people to not fork the kernel interfaces so that there is no
> need to create a library that has to be forked for RaspberryPi-derivatives...
It is not only up to Lemaker, as WiringPi website says although forks 
are encouraged, only Raspberry Pi is officially supported. They do not 
intend to support anything else.
>> I think I have a preference for option (4). If not possible, option (3)
>> will be acceptable, but not as nice :-)
>   Essentially there is no real relationship between the proprietary GPIO
> interface for RPi and the *different* proprietary GPIO interface for BPi, so I
> wouldn't mind solution (1). It's a different upstream with a potentially
> different API...
>
>   By the way, upstream says:
> "This is a modified WiringPi for Banana Pro/Pi. We call it WiringBP."
> So naturally, the package should be called wiringbp.
Good point. I will test and submit a proper patch as wiringbp. Thank you 
both.

Regards
Atilla
