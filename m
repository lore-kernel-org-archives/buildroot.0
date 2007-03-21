From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 21 Mar 2007 15:54:01 -0700
Subject: [Buildroot] [buildroot 0001283]: mpfr patch may stop building
	process
Message-ID: <e5dfb5a40f5825b287bd5e7db3c4e564@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1283 
====================================================================== 
Reported By:                Franck78
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1283
Category:                   Standards Compliance
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-21-2007 15:54 PDT
Last Modified:              03-21-2007 15:54 PDT
====================================================================== 
Summary:                    mpfr patch may stop building process
Description: 
Hello,
package/mpfr doesn't download its 'patch' from the 'dl' dir but directly
from internet.

Annoying because need active connection (or choose config that doesn't
need mpfr ;-) ).

Patch file must dowbloaded as everywhere else in buildroot: from the cache
(dl).

The annoying thing with this file is its name: 'patche'. No indication on
what and what version in the name. Difficult to move this file in a
genaral cache directory.
Better solution is admit it in the buildroot tarball with all other
patches.


Franck

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-21-07 15:54  Franck78       New Issue                                    
03-21-07 15:54  Franck78       Status                   new => assigned     
03-21-07 15:54  Franck78       Assigned To               => buildroot       
======================================================================
