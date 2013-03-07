From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Mar 2013 10:34:49 +0100
Subject: [Buildroot] [PATCH] Revert "uClibc: port linuxthreads
 errnopatch to 0.9.33.2"
In-Reply-To: <C128438637A54EB3922031EED15D1CAF@JohanW7>
References: <1361455787-4846-1-git-send-email-gustavo@zacarias.com.ar>
 <877gm1hhsm.fsf@dell.be.48ers.dk>
 <CFB67F3F72BB450DAF0C0E10C27DFC00@JohanW7>
 <51276813.7050604@zacarias.com.ar>
 <9E7C87F7A6274E3EBBC491EE4122270E@JohanW7>
 <87lia39c5g.fsf@dell.be.48ers.dk> <5137806E.4020507@mind.be>
 <87li9z617u.fsf@dell.be.48ers.dk>
 <C128438637A54EB3922031EED15D1CAF@JohanW7>
Message-ID: <20130307103449.7e251223@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Thu, 7 Mar 2013 10:29:33 +0100, Sagaert Johan wrote:

> Maybe setting the default uClibc-0.9.33.config to use NTPL would
> already be something to consider.

It's already the case. NPTL is the default when available. It's not
directly visible in uClibc-0.9.33.config because Buildroot tweaks it
before starting the uClibc build. See
http://git.buildroot.net/buildroot/tree/toolchain/uClibc/uclibc.mk#n288.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
