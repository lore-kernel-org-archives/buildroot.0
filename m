From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Feb 2018 07:59:38 +0100
Subject: [Buildroot] [PATCH] gcc: or1k: use 20170218 tag instead of
 branch
In-Reply-To: <20180203201821.3924-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 3 Feb 2018 21:18:21 +0100")
References: <20180203201821.3924-1-peter@korsgaard.com>
Message-ID: <87inbbx6p1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > As pointed out by Joel Stanley:
 > https://patchwork.ozlabs.org/patch/863011/

 > Github now longer provides the exact same tarball for the or1k musl-5.4.0
 > tarball, breaking the build.  Even more, musl-5.4.0 is the name of a git
 > branch, not a tag.

 > Fix both problems by changing to the or1k-musl-5.4.0-20170218 tag, which
 > points to the exact same git commit.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
