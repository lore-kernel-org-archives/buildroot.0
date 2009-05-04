From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 May 2009 21:23:42 +0200
Subject: [Buildroot] Problem with LZO package in ARM configuration,
	need help to solve the problem
In-Reply-To: <49FEF1D5.8020203@free.fr> (Cyril HAENEL's message of "Mon\,
	04 May 2009 15\:47\:01 +0200")
References: <49FEC5F7.9070808@free.fr> <877i0x6r8l.fsf@macbook.be.48ers.dk>
	<49FED95C.5040802@free.fr> <87y6td59d7.fsf@macbook.be.48ers.dk>
	<49FEEB68.30800@free.fr> <87tz4156qv.fsf@macbook.be.48ers.dk>
	<49FEF1D5.8020203@free.fr>
Message-ID: <87eiv465a9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cyril" == Cyril HAENEL <chaenel@free.fr> writes:

 Cyril> The problem was in build_arm directory, thus I think it's the target
 Cyril> compilation which fails when we have an already installed (old) arm
 Cyril> toolchain.

I've just committed a workaround to git (a035275) - Could you give it
a try please?

-- 
Bye, Peter Korsgaard
