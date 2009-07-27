From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Jul 2009 10:22:32 +0200
Subject: [Buildroot] [PATCH] toolchain/uClibc: add patch to rename
	getline to get_line in	unifdef.c
In-Reply-To: <20090528213924.14428.52394.stgit@mj.roinet.com> (Pavel Roskin's
	message of "Thu\, 28 May 2009 17\:39\:24 -0400")
References: <20090528213924.14428.52394.stgit@mj.roinet.com>
Message-ID: <8763der0vr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pavel" == Pavel Roskin <proski@gnu.org> writes:

 Pavel> getline() is a standard libc function with a different signature.
 Pavel> Signed-off-by: Pavel Roskin <proski@gnu.org>

Thanks, applied.

-- 
Bye, Peter Korsgaard
