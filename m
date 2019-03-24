From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 23:04:56 +0100
Subject: [Buildroot] [PATCH] package/dropbear: add upstream patch fixing
 TTY mode reset regression
In-Reply-To: <20190324142912.25518-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 24 Mar 2019 15:29:12 +0100")
References: <20190324142912.25518-1-peter@korsgaard.com>
Message-ID: <87ftrcq67r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > 2019.77 added a regression related to resetting TTY mode on exit.  Add an
 > upstream patch to fix it.

 > For more details, see the mailing list:
 > https://lists.ucc.gu.uwa.edu.au/pipermail/dropbear/2019q1/002157.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
