From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2020 20:39:04 +0200
Subject: [Buildroot] [PATCH] package/avahi: disable introspection
In-Reply-To: <20200831140035.5880-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 31 Aug 2020 16:00:35 +0200")
References: <20200831140035.5880-1-peter@korsgaard.com>
Message-ID: <87tuwibqyf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/b9bf7cea8be9231552a10e8ea828bf24394402ba/

 > Building with introspection (together with D-Bus) support currently fails.
 > Fixing it is not trivial, so explicitly disable introspection for now.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
