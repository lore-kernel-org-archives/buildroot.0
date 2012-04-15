From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Apr 2012 11:19:43 +0200
Subject: [Buildroot] [PATCH] Add sam-ba to at91sam926*_defconfig
In-Reply-To: <20120411135031.GS29577@game.jcrosoft.org> (Jean-Christophe
 PLAGNIOL-VILLARD's message of "Wed, 11 Apr 2012 15:50:31 +0200")
References: <1334149610-989-1-git-send-email-alexandre.belloni@piout.net>
 <20120411153529.73613e03@skate>
 <20120411135031.GS29577@game.jcrosoft.org>
Message-ID: <87hawlbbdc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jean-Christophe" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:

Hi,

 Jean-Christophe> this soc config I disagree

 Jean-Christophe> I run on ARM and PPC and samba is x86 only

You build buildroot ON ARM/PPC? That's very uncommon (well, gcc110 is
ppc64 - But still). Nevertheless, nothing breaks by including sam-ba in
the build, your host dir just gets a little bit bigger. In this case I
would say the advantage for the common case (build on x86 for at91
development) outweighs the minor disadvantage for your use case.

-- 
Bye, Peter Korsgaard
