From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Oct 2009 19:19:50 +0100
Subject: [Buildroot] Autoconf still not building (M4 ) results
In-Reply-To: <1256572526.8809.71.camel@coalu.atr> (Lionel Landwerlin's message
	of "Mon\, 26 Oct 2009 16\:55\:26 +0100")
References: <1531E53627F1F749B4FE809BF2A4EB67013CF4C7@WETMEX10.loepfe.com>
	<87a5b0800910260335v1849578y2dadfde9b4a91b22@mail.gmail.com>
	<1531E53627F1F749B4FE809BF2A4EB67013CF69D@WETMEX10.loepfe.com>
	<87a5b0800910260448i2c2d815ep6d16409288fb63e2@mail.gmail.com>
	<1531E53627F1F749B4FE809BF2A4EB67013CF6E1@WETMEX10.loepfe.com>
	<87a5b0800910260511ta958c1ehaaae17914a5792a2@mail.gmail.com>
	<1531E53627F1F749B4FE809BF2A4EB67013CF704@WETMEX10.loepfe.com>
	<87d44afhoy.fsf@macbook.be.48ers.dk>
	<1256572526.8809.71.camel@coalu.atr>
Message-ID: <87vdi2dnll.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:

Hi,

 Lionel> Just for confirmation, Debian unstable is running dash as
 Lionel> default shell.

 Lionel> Thanks again for debugging.

Ok, so the easiest fix is probably to to s^!/bin/sh^!/bin/bash^ on the
first line of the configure script - And then report the issue upstream.

What I don't get is that Johan wrote that the configure script didn't
break when run outside buildroot - How could that be?

-- 
Bye, Peter Korsgaard
