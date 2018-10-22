From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 22 Oct 2018 04:23:08 -0500
Subject: [Buildroot] autobuilder sandbox
Message-ID: <CANQCQpa_R+UwyhmNZGeKyOtN2G3487r6-T8zaDayGufq7g2g3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was able to get a script using the bubblewrap project working.  It
remaps the mounted filesystem environment read-only around the
application/shell you call.   I was wondering what the best strategy
would be to start introducing these type of build failures?   Maybe
the autobuilder support for an alternate repo and branch needs to be
merged first?

For now, I'll keep running an internal sandboxed autobuilder and work
out the bugs.  It already has found a few interesting issues.

Matt
