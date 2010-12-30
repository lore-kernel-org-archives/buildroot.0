From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Thu, 30 Dec 2010 21:40:20 +0100
Subject: [Buildroot] Multiple build errors on the target toolchain for
	mips:
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1EAEBFB0@EXV1.corp.adtran.com>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EAEBFB0@EXV1.corp.adtran.com>
Message-ID: <AANLkTikWrX7W9D0kV7syrbVwpQ-bN12e3RiXf1Vbc2Av@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2010/12/30 ANDY KENNEDY <ANDY.KENNEDY@adtran.com>:
> I'm thinking that there is a $CC not being set somewhere -- as this is
> building with /usr/bin/gcc:

Will it have to do with my reset env contribution?
http://git.buildroot.net/buildroot/commit/?id=2bf3c1660965d73a553d3c99d6f1a62f36e0069b
