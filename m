From: Alex Suykov <alex.suykov@gmail.com>
Date: Tue, 24 Feb 2015 12:43:00 +0200
Subject: [Buildroot] Large changesets
Message-ID: <20150224104300.GA24526@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What's the best way to submit a relatively large patchset for review?
Especially considering there may be v2, v3 etc.

I'm working on some init-related stuff, and the first stage there is
moving service file installation code (that's /etc/init.d/*, *.service)
out of project .mk files and into pkg-generic.mk.

So there's one patch that does pkg-generic changes, followed by one
patch per package for each package that has service files, that's 70+
patches already, a bit too much to post right away I think.
