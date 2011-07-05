From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Jul 2011 15:01:49 +0200
Subject: [Buildroot] lame linking issue
In-Reply-To: <4E12FE2E.6090206@visionsystems.de> (Yegor Yefremov's message of
 "Tue, 05 Jul 2011 14:06:06 +0200")
References: <4E0DD227.6050807@visionsystems.de>
 <87hb71xgt5.fsf@macbook.be.48ers.dk>
 <4E12D425.1010201@visionsystems.de>
 <87iprhw05l.fsf@macbook.be.48ers.dk>
 <4E12E104.8050403@visionsystems.de>
 <8762nhvy1n.fsf@macbook.be.48ers.dk>
 <4E12E382.6050602@visionsystems.de>
 <871uy5vue9.fsf@macbook.be.48ers.dk>
 <4E12FE2E.6090206@visionsystems.de>
Message-ID: <87wrfwvq2q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

Hi,

 >> Ok, try adding LAME_CONF_ENV = GTK_CONFIG=/bin/false and see if that
 >> helps.

 Yegor> Yes, it helped. Thanks!

Ok, great - I've committed a fix.

-- 
Bye, Peter Korsgaard
