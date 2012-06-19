From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 19 Jun 2012 12:19:41 +0100
Subject: [Buildroot] [PATCH] sudo: fix install
In-Reply-To: <20120619125137.3513cfee@skate>
References: <1340102153-22387-1-git-send-email-spdawson@gmail.com>
 <20120619125137.3513cfee@skate>
Message-ID: <CAHt8ZCOFvA4dyv6iNSimgzfykOWEWDU1KZWFW2Z9AGuWJN-y1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Do you think you can turn this into a patch that can be submitted
> upstream? I.e, if autoconf has detected that we're cross-compiling,
> skip this install check?

I've submitted a bug report to the sudo Bugzilla:

  http://www.gratisoft.us/bugzilla/show_bug.cgi?id=560

To be honest, my knowledge of autoconf/automake is not sufficient to
be able to fix this properly; specifically, I don't know how or if the
cross-compile can be detected in the Makefiles. If someone can point
me in the right direction I'm quite happy to send a patch upstream...
