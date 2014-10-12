From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 09:46:41 +0200
Subject: [Buildroot] [PATCH 2/2] uclibc: Make __SIGEV_PAD_SIZE to take
	__WORDSIZE into account
In-Reply-To: <1389202364-19387-2-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Wed, 8 Jan 2014 17:32:44 +0000")
References: <1389202364-19387-1-git-send-email-Vincent.Riera@imgtec.com>
 <1389202364-19387-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87bnph3f32.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Applying an upstream patch to make __SIGEV_PAD_SIZE to take __WORDSIZE
 > into account for alpha, mips and ia64 arches.

 > Upstream patch URL:
 >    http://git.uclibc.org/uClibc/commit/libc/sysdeps/linux?id=b97b4b698b023f75b54f987859c856ab4861ea00

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
