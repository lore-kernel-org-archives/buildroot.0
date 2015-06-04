From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Jun 2015 15:30:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/ccache: bump to version 3.2.2
In-Reply-To: <1433164670-39296-1-git-send-email-kaszak@gmail.com> (Karoly
 Kasza's message of "Mon, 1 Jun 2015 15:17:50 +0200")
References: <1433164670-39296-1-git-send-email-kaszak@gmail.com>
Message-ID: <87y4jzob21.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Karoly" == Karoly Kasza <kaszak@gmail.com> writes:

 > Bump ccache to minor version 3.2.2.
 > Also changed download URL to https.

 > Signed-off-by: Karoly Kasza <kaszak@gmail.com>

Committed, thanks.

I was going to say that we prefer http:// over https:// when we have a
hash file (as older wget versions have various problems), but as http://
redirects to https anyway, it doesn't matter.

-- 
Bye, Peter Korsgaard
