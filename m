From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Nov 2019 19:43:56 +0100
Subject: [Buildroot] [PATCH-2019.02.x] package/libarchive: add upstream
 security fix for CVE-2019-18408
In-Reply-To: <20191103103815.31359-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 3 Nov 2019 11:38:15 +0100")
References: <20191103103815.31359-1-peter@korsgaard.com>
Message-ID: <875zk0hkb7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - CVE-2019-18408: archive_read_format_rar_read_data in
 >   archive_read_support_format_rar.c in libarchive before 3.4.0 has a
 >   use-after-free in a certain ARCHIVE_FAILED situation, related to
 >   Ppmd7_DecodeSymbol.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
