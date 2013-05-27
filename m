From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 00:28:11 +0200
Subject: [Buildroot] Buildroot / Eclipse integration, version 2.1.0 released!
Message-ID: <20130528002811.164a038f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm happy to announce that M?lanie Bats has released version 2.1.0 of
the Buildroot/Eclipse integration yesterday. It has been uploaded to
the Buildroot Eclipse update site at
http://buildroot.org/downloads/eclipse/, so updates should be automatic
for users.

This release fixes a major regression that was introduced in version
2.0.0, which was causing toolchain configurations to become "orphaned"
as soon as you exited and restarted Eclipse. This bug is now fixed, and
makes the plugin really usable again.

As usual, we are very interested by your comments and suggestions about
those developments.

For more information, please consult the project's wiki at
https://github.com/mbats/eclipse-buildroot-bundle/wiki.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
