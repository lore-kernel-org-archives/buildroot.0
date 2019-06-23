From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 23:32:18 +0200
Subject: [Buildroot] [PATCH 3/3] package/python3: add upstream security
 fix for CVE-2019-10160
In-Reply-To: <20190616211712.824-3-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 16 Jun 2019 23:17:11 +0200")
References: <20190616211712.824-1-peter@korsgaard.com>
 <20190616211712.824-3-peter@korsgaard.com>
Message-ID: <87fto09ee5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2019-10160: urlsplit does not handle NFKC normalization (2nd fix)
 > While the fix for CVE-2019-9936 is included in 3.7.3, the followup
 > regression fixes unfortunatly aren't.

 > https://bugs.python.org/issue36742

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
