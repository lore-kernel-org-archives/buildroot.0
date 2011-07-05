From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Jul 2011 13:28:30 +0200
Subject: [Buildroot] lame linking issue
In-Reply-To: <4E12E382.6050602@visionsystems.de> (Yegor Yefremov's message of
 "Tue, 05 Jul 2011 12:12:18 +0200")
References: <4E0DD227.6050807@visionsystems.de>
 <87hb71xgt5.fsf@macbook.be.48ers.dk>
 <4E12D425.1010201@visionsystems.de>
 <87iprhw05l.fsf@macbook.be.48ers.dk>
 <4E12E104.8050403@visionsystems.de>
 <8762nhvy1n.fsf@macbook.be.48ers.dk>
 <4E12E382.6050602@visionsystems.de>
Message-ID: <871uy5vue9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

Hi,

 >> There's indeed a gtk-1.2 reference. Do you have gtk-config on your host?

 Yegor> Yes, I have.

Ok, try adding LAME_CONF_ENV = GTK_CONFIG=/bin/false and see if that
helps.

-- 
Bye, Peter Korsgaard
