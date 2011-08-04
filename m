From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Aug 2011 21:28:38 +0200
Subject: [Buildroot] [PATCH] libsoup: add patch to fix CVE-2011-2054
In-Reply-To: <1312143519-5030-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Sun, 31 Jul 2011 22:18:39 +0200")
References: <1312143519-5030-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87sjphnfh5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Fixes a security hole that caused some SoupServer users to
 Sven> unintentionally allow accessing the entire local filesystem when
 Sven> they thought they were only providing access to a single directory.

 Sven> This is the change from libsoup-2.34.3 backported to 2.32.2. It
 Sven> doesn't include the changes to the test suite though.

Committed, thanks.

-- 
Bye, Peter Korsgaard
