From: piquemal michel <michel_piquemal@yahoo.fr>
Date: Sun, 16 Jun 2013 21:25:31 +0100 (BST)
Subject: [Buildroot] Building with uClibc 0.9.28, Linux 2.6.36
In-Reply-To: <87r4g1vo98.fsf@dell.be.48ers.dk>
References: <1371326730.31593.YahooMailNeo@web171503.mail.ir2.yahoo.com>
 <87bo77yveg.fsf@dell.be.48ers.dk>
 <1371329906.70128.YahooMailNeo@web171503.mail.ir2.yahoo.com>
 <87sj0jxf0n.fsf@dell.be.48ers.dk>
 <1371332003.62321.YahooMailNeo@web171505.mail.ir2.yahoo.com>
 <877ghvxdkf.fsf@dell.be.48ers.dk>
 <1371338781.70346.YahooMailNeo@web171503.mail.ir2.yahoo.com>
 <87r4g1vo98.fsf@dell.be.48ers.dk>
Message-ID: <1371414331.31683.YahooMailNeo@web171504.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

target has been built with gcc 3.4.2...
it does not seem I can select such old version with buildroot 2010-05 :(
Hopefully one older buildroot version can support the right mix...

Best


----- Mail original -----
De?: Peter Korsgaard <jacmet@uclibc.org>
??: piquemal michel <michel_piquemal@yahoo.fr>
Cc?: Peter Korsgaard <jacmet@uclibc.org>; "buildroot at busybox.net" <buildroot@busybox.net>
Envoy? le : Dimanche 16 juin 2013 21h39
Objet?: Re: Building with uClibc 0.9.28, Linux 2.6.36

>>>>> "piquemal" == piquemal michel <michel_piquemal@yahoo.fr> writes:

piquemal> Great, thanks a lot, it does get much further, but there are
piquemal> still some problems with some paths probably.

Sorry, don't know, it's been a while since 2010.05..

piquemal> Or maybe I should use an earlier gcc version...

Yes, you should most likely use an old toolchain version with 0.9.28.

-- 
Bye, Peter Korsgaard
