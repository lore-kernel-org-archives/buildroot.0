From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Nov 2013 10:06:56 +0100
Subject: [Buildroot] New version of PowerVR TI drivers
Message-ID: <20131122100656.02700755@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

A new version of the PowerVR TI drivers has been released:
http://tigraphics.blogspot.fr/2013/11/4q-2013-linux-graphics-sdk-release.html.

"""
New/Changes in this release
NEW  - AM43x support 
NEW - 3.12 kernel support. Please see release notes for the details on the kernel used for validation.
NEW - Integration with reset driver framework on both AM335x & AM43x.
NEW - PM_RUNTIME support enabled by default. (No need to pass this explicitly in build command line)
NEW ? This is an alpha release package. Validated on AM335x PG2.0 GP-EVM & AM43x EVMs.
"""

It would be good if someone having access to
BeagleBoard/BeagleBoardXM/PandaBoard could have a look into this. It's
still unclear to me whether the BeagleBoneBlack will work with this or
not (I see the drivers have support for AM335x, but is that sufficient
I don't know).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
