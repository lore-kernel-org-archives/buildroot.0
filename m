From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Mar 2017 13:37:18 +0100
Subject: [Buildroot] [PATCH 1/2] jasper: add upstream security fix for
	CVE-2017-6850
In-Reply-To: <20170314225822.30891-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 14 Mar 2017 23:58:21 +0100")
References: <20170314225822.30891-1-peter@korsgaard.com>
Message-ID: <87k27qsold.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes a NULL pointer dereference in jp2_cdef_destroy:
 > https://blogs.gentoo.org/ago/2017/01/25/jasper-null-pointer-dereference-in-jp2_cdef_destroy-jp2_cod-c/

 > https://github.com/mdadams/jasper/issues/112

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
