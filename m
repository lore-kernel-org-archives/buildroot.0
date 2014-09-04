From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Sep 2014 17:30:40 +0200
Subject: [Buildroot] [PATCH] boost: Force the target ABI for MIPS
	architecture
In-Reply-To: <1409757049-63061-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Wed, 3 Sep 2014 16:10:49 +0100")
References: <1409757049-63061-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87fvg7qu73.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > The default ABI used in boost is 'sysv' which is not valid for MIPS.
 > Given the boost build system doesn't detect the right ABI when we are
 > cross-compiling, we fix this by passing the right ABI directly to the
 > boost options for the target.

 > Related:
 >   https://svn.boost.org/trac/boost/ticket/10442

 > Fixes:
 >   http://autobuild.buildroot.net/results/79f/79fe4caffb9a3b9f1b203498a589a5172bd0acea/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
