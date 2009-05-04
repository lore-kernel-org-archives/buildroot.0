From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 May 2009 14:40:52 +0200
Subject: [Buildroot] Problem with LZO package in ARM configuration,
	need help to solve the problem
In-Reply-To: <49FED95C.5040802@free.fr> (Cyril HAENEL's message of "Mon\,
	04 May 2009 14\:02\:36 +0200")
References: <49FEC5F7.9070808@free.fr> <877i0x6r8l.fsf@macbook.be.48ers.dk>
	<49FED95C.5040802@free.fr>
Message-ID: <87y6td59d7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cyril" == Cyril HAENEL <chaenel@free.fr> writes:

Hi,

 Cyril> In fact when we activate jffs2 filesystem output, lzo must be compiled
 Cyril> for the host, thus why does it first try to use arm-linux-g++ !? It's
 Cyril> why I am the only one to have this problem since some week, because I
 Cyril> am the only one to have a arm toolchain installed on my computer !!

 Cyril> There is surely a bug to fix somewhere, but I don't know where !?

Hmm, are you sure this is lzo-host compilation, and not lzo for the
target?

-- 
Bye, Peter Korsgaard
