From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Aug 2018 11:35:04 +0200
Subject: [Buildroot] [PATCH] dropbear: add upstream security fix for
 CVE-2018-15599
In-Reply-To: <20180826214037.5025-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 26 Aug 2018 23:40:37 +0200")
References: <20180826214037.5025-1-peter@korsgaard.com>
Message-ID: <875zzw9mpj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > dropbear is affected by an user enumeration vulnerability similar to the
 > recent issue in openssh (CVE-2018-15473).  Add an upstream patch fixing the
 > issue.

 > For more details, see the discussion on the mailing list:
 > http://lists.ucc.gu.uwa.edu.au/pipermail/dropbear/2018q3/002110.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
