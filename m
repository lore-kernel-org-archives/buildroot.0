From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Feb 2019 08:57:03 +0100
Subject: [Buildroot] [PATCH-2018.02.x] package/perl: security bump to
 version 5.26.3
In-Reply-To: <20190224214647.11184-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 24 Feb 2019 22:46:47 +0100")
References: <20190224214647.11184-1-peter@korsgaard.com>
Message-ID: <8736ocfghc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - [CVE-2018-12015] Directory traversal in module Archive::Tar
 > - [CVE-2018-18311] Integer overflow leading to buffer overflow and segmentation fault
 > - [CVE-2018-18312] Heap-buffer-overflow write in S_regatom (regcomp.c)
 > - [CVE-2018-18313] Heap-buffer-overflow read in S_grok_bslash_N (regcomp.c)
 > - [CVE-2018-18314] Heap-buffer-overflow write in S_regatom (regcomp.c)

 > For more details, see perldelta:
 > https://metacpan.org/changes/release/SHAY/perl-5.26.3

 > Bump perlcross to 1.2.2 for perl 5.26.3 support.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
