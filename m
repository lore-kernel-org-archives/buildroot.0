From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Oct 2009 10:15:34 +0200
Subject: [Buildroot] [PATCH] libarchive: add conditional dependency on
	zlib
In-Reply-To: <1256284392-30337-1-git-send-email-s.neumann@raumfeld.com> (Sven
	Neumann's message of "Fri\, 23 Oct 2009 09\:53\:12 +0200")
References: <878wf2o910.fsf@macbook.be.48ers.dk>
	<1256284392-30337-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87zl7imspl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> If zlib is selected, then it should be built before libarchive so that
 Sven> libarchive picks up the headers and includes support for zlib
 Sven> compression.

Committed, thanks.

-- 
Bye, Peter Korsgaard
