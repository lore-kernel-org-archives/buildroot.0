From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Oct 2013 08:41:48 +0200
Subject: [Buildroot] [PATCH] perf: disable documentation
In-Reply-To: <1382570881-18589-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Thu, 24 Oct 2013 01:28:01 +0200")
References: <1382570881-18589-1-git-send-email-arnout@mind.be>
Message-ID: <87y55j891v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > perf uses asciidoc to generate documentation, but /usr/bin/asciidoc will
 > try to use buildroot's host-python which doesn't have the required
 > unicodedata. Recent kernels always try to build the man pages when
 > installing. To avoid that, define ASCIIDOC as an empty string so the
 > Makefile can't find the executable and skips the documentation
 > generation.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
