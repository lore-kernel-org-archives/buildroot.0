From: Dan Moulding <dan.moulding@rackwareinc.com>
Date: Mon, 28 Apr 2014 11:11:31 -0600 (MDT)
Subject: [Buildroot] =?utf-8?q?What_happened_to_uclibc-update-config=3F?=
Message-ID: <1398705091.394515596@apps.rackspace.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am attempting to save my customized uclibc configuration using the methods prescribed in the Buildroot user manual. It mentions the existence of several "*-update-config" "make" targets. I've done "make busybox-update-config" and that seems to work just fine. But when I try "make uclibc-update-config" I get a "No rule to make target" error from "make".

Looking back in the history, I see that the "uclibc-update-config" target was removed when uClibc was converted to the package infrastructure (commit a5e92d9). Was it never added back? Is there an alternative? Or do I need to just manually copy the .config for uclibc for now?

Thanks!

Dan Moulding
Software Engineer
RackWare, Inc.
