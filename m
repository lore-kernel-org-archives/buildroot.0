From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Dec 2012 14:40:55 -0800
Subject: [Buildroot] [Bug 5750] buildroot-2012.11 while building X11 for
	ARM, errors on  xlib_libX11-1.4.2
In-Reply-To: <20121205222809.28faea35@skate> (Thomas Petazzoni's message of
 "Wed, 5 Dec 2012 22:28:09 +0100")
References: <bug-5750-163@https.bugs.busybox.net/>
 <20121205075957.00AEA99A07@busybox.osuosl.org>
 <50BF826F.4060004@mind.be> <87txs08adj.fsf@dell.be.48ers.dk>
 <20121205222809.28faea35@skate>
Message-ID: <87hao086mg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Arnout> We should at least have a check for that...
 >> 
 >> Indeed. I'm looking into adding one.

 Thomas> Well, I think we should rather fix the problem. I have a fix
 Thomas> that works for most cases, except for the stupid libglib2
 Thomas> package that generates incorrect .la files...

Ahh, even better.

-- 
Bye, Peter Korsgaard
