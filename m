From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Fri, 23 Jan 2009 09:57:12 +0100
Subject: [Buildroot] How handle broken or partly broken packages in the
 distribution
In-Reply-To: <1232651253.5311.19.camel@elrond.atmel.com>
References: <1232651253.5311.19.camel@elrond.atmel.com>
Message-ID: <20090123095712.6878553d@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 22 Jan 2009 20:07:33 +0100
Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:

<snipp list of packages>
 
> I suggest we disable them using
> 	depends on "BR2_avr32
> 

I assume " was supposed to be !.

> so they are not selectable for AVR32 users
> 

To make it harder to fix the problem with the packages?

It might also be a result from the development environment on your
build machine, like the recent alsa-utils errors somebody else found on
opensuse, which I have not triggered in my Ubuntu system.

-- 
Best regards,
Hans-Christian Egtvedt
