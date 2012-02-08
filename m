From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Feb 2012 10:34:18 +0100
Subject: [Buildroot] [PATCH] New package: gpio9260
In-Reply-To: <20120208091043.GB19413@game.jcrosoft.org> (Jean-Christophe
 PLAGNIOL-VILLARD's message of "Wed, 8 Feb 2012 10:10:43 +0100")
References: <1328559215-12206-1-git-send-email-jwoltz@gmail.com>
 <20120208091043.GB19413@game.jcrosoft.org>
Message-ID: <87y5sd8y91.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jean-Christophe" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:

 Jean-Christophe> On 15:13 Mon 06 Feb     , J.C. Woltz wrote:
 >> From: "J.C. Woltz" <jwoltz@gmail.com>
 >> 
 >> gpio9260 is an utility used to read and set gpio states on
 >> the at91sam9260 and at91sam9g20 CPUs
 Jean-Christophe> why dont u use the kernel instead via sysfs

My comment as well.

 Jean-Christophe> If this need kernel modification I don't think it will
 go mainline

It's just a glorified devmem2 (E.G. using /dev/mem). It turns out it's
from 2004, so from before gpiolib got added to the kernel.

-- 
Bye, Peter Korsgaard
