From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Jun 2013 23:03:52 +0200
Subject: [Buildroot] Building with uClibc 0.9.28, Linux 2.6.36
In-Reply-To: <1371329906.70128.YahooMailNeo@web171503.mail.ir2.yahoo.com>
 (piquemal michel's message of "Sat, 15 Jun 2013 21:58:26 +0100 (BST)")
References: <1371326730.31593.YahooMailNeo@web171503.mail.ir2.yahoo.com>
 <87bo77yveg.fsf@dell.be.48ers.dk>
 <1371329906.70128.YahooMailNeo@web171503.mail.ir2.yahoo.com>
Message-ID: <87sj0jxf0n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "piquemal" == piquemal michel <michel_piquemal@yahoo.fr> writes:

 piquemal> Thanks Peter for your quick answer.
 piquemal> Actually that version supports only 0.9.30 and 0.9.31.

No, but the older options are only available if you enable
BR2_DEPRECATED under build options:

http://git.buildroot.net/buildroot/tree/toolchain/uClibc/Config.in?id=2010.05


-- 
Bye, Peter Korsgaard
