From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 01 Jun 2009 08:05:47 +0200
Subject: [Buildroot] [PATCH] toolchain/uClibc: add patch to rename
	getline to get_line in	unifdef.c
In-Reply-To: <20090528213924.14428.52394.stgit@mj.roinet.com> (Pavel Roskin's
	message of "Thu\, 28 May 2009 17\:39\:24 -0400")
References: <20090528213924.14428.52394.stgit@mj.roinet.com>
Message-ID: <87my8s4hfo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pavel" == Pavel Roskin <proski@gnu.org> writes:

 Pavel> getline() is a standard libc function with a different signature.
 Pavel> Signed-off-by: Pavel Roskin <proski@gnu.org>

I can see how this might confuse stuff, but what error do you get
exactly? Have you sent this to the uclibc people?

-- 
Bye, Peter Korsgaard
