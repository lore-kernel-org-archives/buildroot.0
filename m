From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 14 Jul 2007 00:20:31 +0200
Subject: [Buildroot] Linux build files.
In-Reply-To: <f0528b5b0707130429k245ca1f3x58a70735007f45c3@mail.gmail.com>
References: <1184260756.5175.57.camel@elrond.sweden.atmel.com>
	<f0528b5b0707130429k245ca1f3x58a70735007f45c3@mail.gmail.com>
Message-ID: <1184365231.22266.12.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2007-07-13 klockan 13:29 +0200 skrev Julien Letessier:
> 2007/7/12, Ulf Samuelsson <ulf@atmel.com>:
> > Here is the target/linux/Config.in and target/linux/Makefile.in
> > that I use in my local buildroot from 2007-05-31.
> 
> Nice!
> I'm eager to test this.
> 
> For future emails, could you please attach the files/patches rather
> than put the inline in the message body? Copy-pasting is tedious and
> error-prone, and inlining prevents MUAs from displaying an "has
> attachment" icon/label.
> 
> Thanks,


I am thinking of submitting this as an optional (experimental) way
of configuring the linux kernel, with default to the original 
way of doing things. I.E: you have to actively set a flag
to use the experimental configuration.

Then it will be easier to test and provide feedback.
Is this an acceptable way to proceed?

Will update to use the latest kernels including mm and git patches
before I submit.

Best Regards
Ulf Samuelsson
