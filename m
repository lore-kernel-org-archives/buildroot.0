From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Fri, 9 Mar 2012 17:03:49 +0100
Subject: [Buildroot] Howto track/trace segfaults on ARM ?
Message-ID: <1531E53627F1F749B4FE809BF2A4EB67030D4CBD@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Probably not the GOOD place to ask for this information, but.. Going to
give it a shot.

I'm still working on WebKit-1.6.3 for buildroot (which seems to work ,
at least , I get in compiled..)

FYI: I'm cross-compiling for ARM (imx537).
 
But, when running the WebKit Code (GtkLauncher, which is a
mini-WebKit-browser) I get a lot of crashes / segmentation faults /
aborts.

Is there somebody that can point me in direction on how to find/trace
these segmentation faults ... ???? 

I would like go go deeper into detail in order to find the crashes.


All hints are Welcome,
Thanks.


PS: If I do the same build on a native PC (x86) then it does not
segfault.
