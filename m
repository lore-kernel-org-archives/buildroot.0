From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Apr 2018 17:46:57 +0200
Subject: [Buildroot] [PATCH 1/2] python-webpy: needs hashlib support in
 python
In-Reply-To: <20180404155132.17500-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 4 Apr 2018 17:51:31 +0200")
References: <20180404155132.17500-1-peter@korsgaard.com>
Message-ID: <874lkh21am.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > webpy uses hashlib for session handling, so ensure it is available:
 > web/session.py:    import hashlib
 > web/session.py:    sha1 = hashlib.sha1

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
