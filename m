From: Michael Roth <mroth@nessie.de>
Date: Wed, 29 Apr 2009 13:35:46 +0200
Subject: [Buildroot] [PATCH] uClibc: fix 0.9.30.1
 build	with	linuxthreads on ARM
In-Reply-To: <20090429112256.GA18534@mx.loc>
References: <1240997522-10973-1-git-send-email-mroth@nessie.de>	<87y6tjdcgj.fsf@macbook.be.48ers.dk>
	<20090429112256.GA18534@mx.loc>
Message-ID: <49F83B92.7060008@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Reutner-Fischer schrieb:

> And, furthermore, does it work?

At least, for me. I have an application which uses threads and it
is working without any problems.

> Please post the complete results of the thread-tests from 'make test'.
> thanks,

Where can I find them? Part of uClibc?
I only have a cross toolchain, no native...


Michael
