From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Nov 2019 14:17:25 +0100
Subject: [Buildroot] [PATCH 01/11] package/chrony: use libedit for
 command line editing
In-Reply-To: <20191113151724.12155-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 13 Nov 2019 16:17:14 +0100")
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-2-peter@korsgaard.com>
Message-ID: <87k17xqq6y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > chrony is licensed under GPL-2.0, which is not license compatible with
 > readline (GPL-3.0+), so remove the optional readline handling and replace
 > with libedit instead.

 > While we are at it, also explicitly disable the libedit backend when not
 > available.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
