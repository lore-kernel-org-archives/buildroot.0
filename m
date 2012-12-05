From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Dec 2012 13:19:52 -0800
Subject: [Buildroot] [Bug 5750] buildroot-2012.11 while building X11 for
	ARM, errors on  xlib_libX11-1.4.2
In-Reply-To: <50BF826F.4060004@mind.be> (Arnout Vandecappelle's message of
 "Wed, 05 Dec 2012 18:20:47 +0100")
References: <bug-5750-163@https.bugs.busybox.net/>
 <20121205075957.00AEA99A07@busybox.osuosl.org>
 <50BF826F.4060004@mind.be>
Message-ID: <87txs08adj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> For some complicated reason, using Buildroot in a directory stored
 >> under /usr doesn't work. We will work on fixing that, but in the
 >> mean time, please build from /home/something, /opt or anything else,
 >> but not from a subdirectory of /usr.

 Arnout>  We should at least have a check for that...

Indeed. I'm looking into adding one.

-- 
Bye, Peter Korsgaard
