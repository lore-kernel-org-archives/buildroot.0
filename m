From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 20 Feb 2014 10:55:50 +0100
Subject: [Buildroot] Parallel make messes up post-build in -next
Message-ID: <20140220095550.GA16493@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I am currently testing the -next branch and I've encountered the following
problem: the copy of my overlay and the execution of my post-build script is
now performed *after* the generation of my image.

Reverting commit a24877586a566e052897e50e6a0c2f53cfb029f5, which adds support
for top-level parallel make, fixes the issue.

Has anyone else experienced this problem?

Best regards,
ELB
