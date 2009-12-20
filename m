From: Marcel <korgull@home.nl>
Date: Sun, 20 Dec 2009 15:06:20 +0100
Subject: [Buildroot] develop using buildroot
Message-ID: <200912201506.20584.korgull@home.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm having some issues setting up a workable environment.
I need to write my own kernel drivers, add some packages and change u-boot.

buildroot requires patches, so that's clear but I wonder how to efficiently 
develop those patches.

Do I set up the kernel and u-boot outside buildroot, than create patches form 
there and than include those in buildroot ?

Or, do I compile buildroot, than develop my code from there and generate 
patches ?

Or.....is there a better way ?

regards,
Marcel
