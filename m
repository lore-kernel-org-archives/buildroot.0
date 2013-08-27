From: clshotwe at rockwellcollins.com <clshotwe@rockwellcollins.com>
Date: Tue, 27 Aug 2013 11:20:25 -0500
Subject: [Buildroot] SELinux Buildroot Additions
Message-ID: <OFC105562B.76AF62E8-ON86257BD4.005985FE-86257BD4.0059C2DD@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I would like to get some feedback on adding SELinux support to Buildroot. 
This would involve adding several packages, modifying the .mk files for 
several packages to include SELinux support, and adding generic defconfigs 
to use as examples.  I would like to have defconfigs for QEMU targets 
(x86, ARM, PPC) along with a Pandaboard and another couple hardware 
targets.  The package selection for a functional SELinux system is a 
little complex so the example defconfigs would be nice to use as examples.

Would this be a welcomed addition to Buildroot?  I would like to submit a 
set of patches to first add the new packages, then modify existing 
packages, and then add in the example defconfigs one at a time.  Is this 
the best approach to take?

Thanks,
Clayton

Clayton Shotwell
Software Engineer 
clshotwe at rockwellcollins.com
www.rockwellcollins.com 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130827/997c18ef/attachment.html>
