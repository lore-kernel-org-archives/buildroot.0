From: Chris LaRocque <clarocq@gmail.com>
Date: Wed, 30 Dec 2015 13:34:35 -0500
Subject: [Buildroot] updating the beaglebone black defconfig
Message-ID: <n6183t$ket$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I'm working to update the beaglebone defconfig to kernel 4.1.13 ti 36 branch 
(github.com/beagleboard/linux).

The build works but I want to incorporate a patched version of DTC 
(github.com/pantoniou/dtc/tree/dt-overlays5) to support the cape manager and 
device tree overlay changes. At this pont I'd appreciate some guidance.

My first thought was to simply patch the buildroot dtc package files to pull 
from the new location. This looks to be the most direct, probably only 
requiring that place the file in board/beaglebone/patches/dtc?

Second, try to dynamically create a patch for the mainline dtc to the bb.org 
fork. Haven't thought this through yet. A pointer or two would be 
appreciated. I thought to use 'git diff'?

Regards

Chris
