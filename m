From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Feb 2019 09:46:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: Fix build issue with
 libbsd wchar check
In-Reply-To: <20190101154105.22148-1-vadim4j@gmail.com> (Vadim Kochan's
 message of "Tue, 1 Jan 2019 17:41:05 +0200")
References: <20190101154105.22148-1-vadim4j@gmail.com>
Message-ID: <87va1ahoxt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vadim" == Vadim Kochan <vadim4j@gmail.com> writes:

 > stress-ng uses test/test-bsd-wchar.c program to check if there is
 > support for libbsd's wchar, but the test fails because wchar.h also
 > requires the FILE* definition from stdio.h which is not included
 > automatically, so fix it by include stdio.h explicitly.

 > Fixes:
 > 	http://autobuild.buildroot.net/results/6def1bba8e7ec05682e74c4edc3a35c8c118d28b

 > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
