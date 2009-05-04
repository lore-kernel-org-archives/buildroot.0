From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 May 2009 15:37:28 +0200
Subject: [Buildroot] Problem with LZO package in ARM configuration,
	need help to solve the problem
In-Reply-To: <49FEEB68.30800@free.fr> (Cyril HAENEL's message of "Mon\,
	04 May 2009 15\:19\:36 +0200")
References: <49FEC5F7.9070808@free.fr> <877i0x6r8l.fsf@macbook.be.48ers.dk>
	<49FED95C.5040802@free.fr> <87y6td59d7.fsf@macbook.be.48ers.dk>
	<49FEEB68.30800@free.fr>
Message-ID: <87tz4156qv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cyril" == Cyril HAENEL <chaenel@free.fr> writes:

Hi,

 Cyril> I think lzo is compiled in the 2 configuration, for the host and for
 Cyril> the target.
 Cyril> Because when we activate the jffs2 filesystem output, I think
 Cyril> buildroot need mkfs.jffs2 and I think mkfs.jffs2 needs lzo.
 Cyril> But because mtd-utils (and also mkfs.jffs2) is provided in the target,
 Cyril> I think lzo is also compiled for the target.

Exactly - What is it that fails, lzo for the host or lzo for the
target? (the directory name should show it)

-- 
Bye, Peter Korsgaard
