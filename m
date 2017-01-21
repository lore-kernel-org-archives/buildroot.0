From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Sat, 21 Jan 2017 19:23:43 +0100
Subject: [Buildroot] Updating GNU classpath
Message-ID: <98391600-4a26-2b57-ba89-fb2bd4dd1787@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,
I wanted to update GNU classpath to version 0.99 (released March 2012,
but anyway, latest release).

Unfortunately there seems to be a bug in the autoconf scripts, such that
configure always fails when specifying --disable-tools[1].
I'm no expert in autoconf scripts but I looked at them for some time and
couldn't find the root cause of the bug.

Can we enable the tools option and delete the binaries before/after
installing? Or just enable this option and be done with it?
It bumps the package size from ~ 9.6 MB to 10.7 MB.

What is the preferred way forward?

Thanks,
Marcus


[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70660
