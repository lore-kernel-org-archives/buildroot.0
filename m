From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Apr 2021 15:11:51 +0200
Subject: [Buildroot] [PATCH] package/busybox: add upstream gunzip
 security fix
In-Reply-To: <20210406130702.1165-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 6 Apr 2021 15:07:02 +0200")
References: <20210406130702.1165-1-peter@korsgaard.com>
Message-ID: <87a6qbftgo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - CVE-2021-28831: decompress_gunzip.c in BusyBox through 1.32.1 mishandles
 >   the error bit on the huft_build result pointer, with a resultant invalid
 >   free or segmentation fault, via malformed gzip data.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Ups, I forgot the _IGNORE_CVES entry. Will send a v2.

-- 
Bye, Peter Korsgaard
