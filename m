From: piquemal michel <michel_piquemal@yahoo.fr>
Date: Sat, 15 Jun 2013 22:33:23 +0100 (BST)
Subject: [Buildroot] Building with uClibc 0.9.28, Linux 2.6.36
In-Reply-To: <87sj0jxf0n.fsf@dell.be.48ers.dk>
References: <1371326730.31593.YahooMailNeo@web171503.mail.ir2.yahoo.com>
 <87bo77yveg.fsf@dell.be.48ers.dk>
 <1371329906.70128.YahooMailNeo@web171503.mail.ir2.yahoo.com>
 <87sj0jxf0n.fsf@dell.be.48ers.dk>
Message-ID: <1371332003.62321.YahooMailNeo@web171505.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hum, thanks!
however what does
depends on !BR2_avr32
mean: could not find which option it is.



----- Mail original -----
De?: Peter Korsgaard <jacmet@uclibc.org>
??: piquemal michel <michel_piquemal@yahoo.fr>
Cc?: Peter Korsgaard <jacmet@uclibc.org>; "buildroot at busybox.net" <buildroot@busybox.net>
Envoy? le : Samedi 15 juin 2013 23h03
Objet?: Re: Building with uClibc 0.9.28, Linux 2.6.36

>>>>> "piquemal" == piquemal michel <michel_piquemal@yahoo.fr> writes:

piquemal> Thanks Peter for your quick answer.
piquemal> Actually that version supports only 0.9.30 and 0.9.31.

No, but the older options are only available if you enable
BR2_DEPRECATED under build options:

http://git.buildroot.net/buildroot/tree/toolchain/uClibc/Config.in?id=2010.05


-- 
Bye, Peter Korsgaard
