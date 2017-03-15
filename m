From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Mar 2017 13:37:22 +0100
Subject: [Buildroot] [PATCH 2/2] jasper: add upstream security fix
In-Reply-To: <20170314225822.30891-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 14 Mar 2017 23:58:22 +0100")
References: <20170314225822.30891-1-peter@korsgaard.com>
 <20170314225822.30891-2-peter@korsgaard.com>
Message-ID: <87fuiesol9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes a NULL Pointer Dereference jp2_encode:
 > https://github.com/mdadams/jasper/issues/120

 > No CVE assigned yet.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
