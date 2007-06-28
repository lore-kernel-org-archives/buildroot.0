From: Tom <fivemiletom@gmail.com>
Date: Thu, 28 Jun 2007 16:57:32 -0700
Subject: [Buildroot] ARM EABI builds
In-Reply-To: <019801c7b9d6$ba07ed10$ebba820a@atmel.com>
References: <20070626133327.GA5989@trinity.fluff.org><468182D7.30509@gmail.com><20070626222500.GP31791@trinity.fluff.org><20070627081954.GR31791@trinity.fluff.org><4682A1F7.3020402@gmail.com>
	<20070628103443.GT31791@trinity.fluff.org>
	<019801c7b9d6$ba07ed10$ebba820a@atmel.com>
Message-ID: <46844AEC.7020007@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson wrote:
>> The problem with buildroot is that it gives you a choice of ARM cpus.
>> If you select ARM920T, then you have an expectation of being able
>> to run the binaries produced on an ARM920T, which currently if EABI
>> is also selected is impossible.
>>
> 
> So should we not just make EABI depend on !ARM920T
> 

I would say no, because this combination works for buildroot. (However, 
if you _only_ select ARM920T and EABI and don't take care of the CPU 
options, it will fail.)
