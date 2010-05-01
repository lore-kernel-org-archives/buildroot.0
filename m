From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 01 May 2010 22:54:14 +0200
Subject: [Buildroot] [PATCH] Fix GDB BFD test linking
In-Reply-To: <20100429191920.6133.88233.stgit@localhost.localdomain> (Paulius
	Zaleckas's message of "Thu, 29 Apr 2010 22:19:20 +0300")
References: <20100429191920.6133.88233.stgit@localhost.localdomain>
Message-ID: <87k4rn5ond.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paulius" == Paulius Zaleckas <paulius.zaleckas@gmail.com> writes:

 Paulius> When compiling GDB for target (in my case i386) it links
 Paulius> wrong BFD library from host OS. This prevents GDB from compiling
 Paulius> support for ELF and thus GDB is unusable on target.

 Paulius> More about this issue was already posted at:
 Paulius> http://lists.uclibc.org/pipermail/buildroot/2009-March/026585.html

 Paulius> Fix this issue by forcing ELF support.

Committed, thanks.

-- 
Bye, Peter Korsgaard
