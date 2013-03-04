From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Mar 2013 20:51:23 +0100
Subject: [Buildroot] [PATCH] Revert "uClibc: port linuxthreads
	errnopatch to 0.9.33.2"
In-Reply-To: <9E7C87F7A6274E3EBBC491EE4122270E@JohanW7> (Sagaert Johan's
 message of "Mon, 4 Mar 2013 20:46:05 +0100")
References: <1361455787-4846-1-git-send-email-gustavo@zacarias.com.ar>
 <877gm1hhsm.fsf@dell.be.48ers.dk>
 <CFB67F3F72BB450DAF0C0E10C27DFC00@JohanW7>
 <51276813.7050604@zacarias.com.ar>
 <9E7C87F7A6274E3EBBC491EE4122270E@JohanW7>
Message-ID: <87lia39c5g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi

 Sagaert> It took some time till I could verify it against real hardware.

 Sagaert> I switched to NTPL and so far got no problems with any package.

 Sagaert> It's a bit mysterious when to use the other options (pthreads
 Sagaert> and pthreads old).  Incompatible packages mostly do build, but
 Sagaert> the problems show up at runtime.

The pthreads options are basically just there for legacy reasons (from
before NPTL existed) and presumably see very little testing these
days. We should aguable deprecate them.

-- 
Bye, Peter Korsgaard
