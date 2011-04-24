From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Apr 2011 23:55:05 +0200
Subject: [Buildroot] [patch] add trival depencies on lockfile-progs,
	should I  open a bug report ?
In-Reply-To: <1303669801.6869.13.camel@segulix> (Sergio Monteiro Basto's
	message of "Sun, 24 Apr 2011 19:30:01 +0100")
References: <1303669801.6869.13.camel@segulix>
Message-ID: <87bozv8gcm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergio" == Sergio Monteiro Basto <sergio@sergiomb.no-ip.org> writes:

 Sergio> Hi, 
 Sergio> I saw this problem a some months ago, is not a new problem.
 Sergio> lockfile-progs must have liblockfile compiled first. 
 Sergio> This patch prevents a compile error when I am building buildroot. And as
 Sergio> work around I have to done:
 Sergio> make liblockfile; make 
 Sergio> to continue the build.

Committed, thanks.

-- 
Bye, Peter Korsgaard
