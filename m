From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 14:38:47 +0200
Subject: [Buildroot] [PATCH 0/4] spice: version bump / security bump
In-Reply-To: <20170621220744.18908-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 22 Jun 2017 00:07:40 +0200")
References: <20170621220744.18908-1-peter@korsgaard.com>
Message-ID: <87o9tahqjs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Our spice version is quite old (2013) and is affected by a number of
 > security issues, so bump to the latest release in the 0.12.x series +
 > upstream post-0.12.8 security fixes.

 > As the configuration options and dependencies have changed quite a bit since
 > 2013, don't just do the entire bump in a single patch, but instead move
 > forward release by release for easier review.

 > Peter Korsgaard (4):
 >   spice: bump to version 0.12.5
 >   spice: security bump to version 0.12.6
 >   spice: security bump to version 0.12.8
 >   spice: add post-0.12.8 upstream security fixes

Committed series to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
