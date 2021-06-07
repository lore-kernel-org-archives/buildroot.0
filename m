From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Jun 2021 23:43:37 +0200
Subject: [Buildroot] [PATCH] package/lz4: add upstream security fix for
 CVE-2021-3520
In-Reply-To: <20210523095239.18348-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 23 May 2021 11:52:39 +0200")
References: <20210523095239.18348-1-peter@korsgaard.com>
Message-ID: <877dj5tkom.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes a potential memory corruption with negative memmove() size.  For
 > details, see (NVD not yet updated):

 > https://security-tracker.debian.org/tracker/CVE-2021-3520

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
