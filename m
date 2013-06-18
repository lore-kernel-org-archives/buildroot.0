From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Jun 2013 15:44:28 +0200
Subject: [Buildroot] Building with uClibc 0.9.28, Linux 2.6.36
In-Reply-To: <1371560776.84702.YahooMailNeo@web171502.mail.ir2.yahoo.com>
 (piquemal michel's message of "Tue, 18 Jun 2013 14:06:16 +0100 (BST)")
References: <1371326730.31593.YahooMailNeo@web171503.mail.ir2.yahoo.com>
 <87bo77yveg.fsf@dell.be.48ers.dk>
 <1371329906.70128.YahooMailNeo@web171503.mail.ir2.yahoo.com>
 <87sj0jxf0n.fsf@dell.be.48ers.dk>
 <1371332003.62321.YahooMailNeo@web171505.mail.ir2.yahoo.com>
 <877ghvxdkf.fsf@dell.be.48ers.dk>
 <1371338781.70346.YahooMailNeo@web171503.mail.ir2.yahoo.com>
 <87r4g1vo98.fsf@dell.be.48ers.dk>
 <1371414331.31683.YahooMailNeo@web171504.mail.ir2.yahoo.com>
 <87li69tdqv.fsf@dell.be.48ers.dk>
 <1371560776.84702.YahooMailNeo@web171502.mail.ir2.yahoo.com>
Message-ID: <87txkvr0sj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "piquemal" == piquemal michel <michel_piquemal@yahoo.fr> writes:

 piquemal> Thanks again Peter for your help and patience!...
 piquemal> I'm almost there (very close!)...

 piquemal> Buildroot 2009.08 allowed me to build a quite close toochain
 piquemal> (linux 2.6.30, gcc 3.4.6, uClibC 0.9.28.3) in relation to my
 piquemal> target (linux 2.6.36, gcc 3.4.2, uClibC 0.9.28)

Great!

 piquemal> Now I'm trying to cross-compile a helloworld sample.
 piquemal> Works great in static and runs on target, but still have some building issue for dynamic linking (my end-goal to enjoy smaller binaries).

 piquemal> mipsel-linux-uclibc-gcc -s -o hello hello.o main.o ?-mulibc

You normally shouldn't need -mulibc. Does it work without?

-- 
Bye, Peter Korsgaard
