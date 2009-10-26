From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Oct 2009 13:44:29 +0100
Subject: [Buildroot] Autoconf still not building (M4 ) results
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB67013CF704@WETMEX10.loepfe.com>
	(Noel Vellemans's message of "Mon\, 26 Oct 2009 13\:20\:19 +0100")
References: <1531E53627F1F749B4FE809BF2A4EB67013CF4C7@WETMEX10.loepfe.com>
	<87a5b0800910260335v1849578y2dadfde9b4a91b22@mail.gmail.com>
	<1531E53627F1F749B4FE809BF2A4EB67013CF69D@WETMEX10.loepfe.com>
	<87a5b0800910260448i2c2d815ep6d16409288fb63e2@mail.gmail.com>
	<1531E53627F1F749B4FE809BF2A4EB67013CF6E1@WETMEX10.loepfe.com>
	<87a5b0800910260511ta958c1ehaaae17914a5792a2@mail.gmail.com>
	<1531E53627F1F749B4FE809BF2A4EB67013CF704@WETMEX10.loepfe.com>
Message-ID: <87d44afhoy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Noel" == Vellemans, Noel <Noel.Vellemans@visionBMS.com> writes:

 Noel> Hi Will,
 Noel> I can confirm .

 Noel> /bin/sh -> fails !! (just re-tested it to be sure it still fails, and it
 Noel> does fail)

 Noel> /bin/bash -> is SUCCESS !!

Ok, so the configure script of autoconf 2.64 fails with shell =
dash. Thanks for the debugging.

-- 
Bye, Peter Korsgaard
