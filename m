From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 07 Nov 2014 14:35:45 +0100
Subject: [Buildroot] [PATCH 2/2] systemd: Properly define the
	__NR_memfd_create macro for MIPS
In-Reply-To: <1415103861-64413-2-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 4 Nov 2014 12:24:21 +0000")
References: <1415103861-64413-1-git-send-email-Vincent.Riera@imgtec.com>
 <1415103861-64413-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87vbmruo9a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > This is an upstream patch which has been applied to the master branch
 > and I have adapted it to make it apply to the v216 version.

 > v217 is not fixed. This patch can be removed when we bump to v218.

 > Upstream commit:
 >   http://cgit.freedesktop.org/systemd/systemd/commit/?id=e6c019026b8cfd27a997e6e6ed1349f8f289b7e2

 > Fixes:
 >   http://autobuild.buildroot.net/results/596/59617a822fb2c8961881dd78a0dc8e41bdb14ede/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
