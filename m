From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 18:22:28 +0200
Subject: [Buildroot] [PATCH 1/4] mongoose: drop unused MONGOOSE_NO_DL
	define
In-Reply-To: <20170921212139.2901-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 21 Sep 2017 23:21:36 +0200")
References: <20170921212139.2901-1-peter@korsgaard.com>
Message-ID: <877ewqr9dn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > This define is not used anywhere in the mongoose sources since v6.0 (commit
 > 8927c9d22b3f), so drop it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed all 4, thanks.

-- 
Bye, Peter Korsgaard
