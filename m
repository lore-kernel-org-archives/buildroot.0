From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 21 Jun 2012 09:44:46 +0100
Subject: [Buildroot] [PATCH] sudo: fix install
In-Reply-To: <CAHt8ZCOFvA4dyv6iNSimgzfykOWEWDU1KZWFW2Z9AGuWJN-y1w@mail.gmail.com>
References: <1340102153-22387-1-git-send-email-spdawson@gmail.com>
 <20120619125137.3513cfee@skate>
 <CAHt8ZCOFvA4dyv6iNSimgzfykOWEWDU1KZWFW2Z9AGuWJN-y1w@mail.gmail.com>
Message-ID: <CAHt8ZCM8p239waMO9pb+oqa4w1_2VmOhBNYgnFGQWJLB9Ps6DQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I've submitted a bug report to the sudo Bugzilla:
>
> ?http://www.gratisoft.us/bugzilla/show_bug.cgi?id=560

The bug has now been fixed upstream (not by me) in commit 8209:0c4e3f68b2f5

Unfortunately, the fix will not appear until sudo 1.8.6 is released,
so we've still got a broken sudo package in Buildroot. I'm going to
submit an updated patch that backports the upstream fix, as an interim
solution until the release of sudo 1.8.6.
