From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 11 Sep 2014 22:52:04 +0200
Subject: [Buildroot] [PATCH] libarchive: avoid some tools to build
	statically on shared builds
In-Reply-To: <1409319547-25577-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Fri, 29 Aug 2014 14:39:07 +0100")
References: <1409319547-25577-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87d2b1dgnf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Some libarchive tools, like bsdtar, builds statically by default
 > although libarchive itself is being built dynamically. We can force
 > those tools to build the same way as libarchive by using the right
 > configure options.

 > Fixes:
 >   http://autobuild.buildroot.net/results/b8f/b8f7a29787ea1cc5c98e4cbd5f47f257f9b306f2/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
