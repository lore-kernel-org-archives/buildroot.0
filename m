From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Apr 2012 19:04:54 +0200
Subject: [Buildroot] [PATCH] Add sam-ba to at91sam926*_defconfig
In-Reply-To: <20120415135655.GN30672@game.jcrosoft.org> (Jean-Christophe
 PLAGNIOL-VILLARD's message of "Sun, 15 Apr 2012 15:56:55 +0200")
References: <1334149610-989-1-git-send-email-alexandre.belloni@piout.net>
 <20120411153529.73613e03@skate>
 <20120411135031.GS29577@game.jcrosoft.org>
 <87hawlbbdc.fsf@macbook.be.48ers.dk>
 <20120415135655.GN30672@game.jcrosoft.org>
Message-ID: <87ty0l9b9l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jean-Christophe" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:

Hi,

 >> You build buildroot ON ARM/PPC? That's very uncommon (well, gcc110 is
 >> ppc64 - But still). Nevertheless, nothing breaks by including sam-ba in
 >> the build, your host dir just gets a little bit bigger. In this case I
 >> would say the advantage for the common case (build on x86 for at91
 >> development) outweighs the minor disadvantage for your use case.

 Jean-Christophe> I've a quad Arm and a quad G4

Both of those are significantly slower than a recent x86, but all the
power to you for using it.

 Jean-Christophe> except you expect a packet you install to work I
 Jean-Christophe> expect to detect the HOST type and propose it only if
 Jean-Christophe> it work

We don't have any concept of host type in Kconfig, so I don't see how we
could possibly do that.

-- 
Bye, Peter Korsgaard
