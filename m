From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Apr 2021 09:26:36 +0200
Subject: [Buildroot] [PATCH v2] package/busybox: add upstream gunzip
 security fix
In-Reply-To: <20210406131200.2156-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 6 Apr 2021 15:11:59 +0200")
References: <20210406131200.2156-1-peter@korsgaard.com>
Message-ID: <877dleees3.fsf@dell.be.48ers.dk>
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

Committed, thanks.

-- 
Bye, Peter Korsgaard
