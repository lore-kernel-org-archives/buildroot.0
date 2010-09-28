From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Sep 2010 14:48:48 +0200
Subject: [Buildroot] [PATCH] add lzop dependency
In-Reply-To: <4CA0542C.4080400@visionsystems.de> (Yegor Yefremov's message of
	"Mon, 27 Sep 2010 10:22:04 +0200")
References: <4CA0542C.4080400@visionsystems.de>
Message-ID: <87aan211an.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> lzop will be required to compress Linux kernel via lzo compression method.
 Yegor> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Lzop isn't that common and it's only needed for a fairly specific setup,
wouldn't it make more sense to build it if needed using the host
infrastructure we have instead?

-- 
Bye, Peter Korsgaard
