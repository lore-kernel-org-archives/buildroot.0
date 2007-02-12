From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:51 -0800
Subject: [Buildroot] [buildroot 0000464]: info files produced have a null
	character
Message-ID: <0129844f20cd2987ca07b917fd964e7f@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=464 
====================================================================== 
Reported By:                mfischer2
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   464
Category:                   Other
Reproducibility:            have not tried
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-03-2005 18:39 PDT
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    info files produced have a null character
Description: 
The info files that are produced(?) by buildroot seem to contain a null
character.  I discovered this when working on the info files and
clearcase, which told me about the problem.  I was able to correct this
with "perl -pi -e 's/\x00/ /g;' filename", but it is a minor annoyance.

I have not tried to repro this, nor am I sure that this is abnormal.  If
it is not abnormal, please just close this.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-03-05 18:39  mfischer2      New Issue                                    
10-03-05 18:39  mfischer2      Status                   new => assigned     
10-03-05 18:39  mfischer2      Assigned To               => uClibc          
01-25-06 07:28  prpplague      Status                   assigned => closed  
01-25-06 07:28  prpplague      Resolution               open => unable to
reproduce
02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
