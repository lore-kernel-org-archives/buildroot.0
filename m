From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 Sep 2013 21:53:36 +0200
Subject: [Buildroot] [PATCH v3 2/2] libcurl: add support for compiling
	with libssh2
In-Reply-To: <1377871785-4964-3-git-send-email-rjbarnet@rockwellcollins.com>
 (Ryan Barnett's message of "Fri, 30 Aug 2013 09:09:45 -0500")
References: <1377871785-4964-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1377871785-4964-3-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <87vc2bxf7j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <rjbarnet@rockwellcollins.com> writes:

 Ryan> Adding configuration options that if libssh2 is selected, compile libcurl
 Ryan> with --with-ssh config flag.

Committed, thanks.

-- 
Bye, Peter Korsgaard
