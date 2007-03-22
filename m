From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 22 Mar 2007 06:21:28 -0700
Subject: [Buildroot] [buildroot 0001283]: mpfr patch may stop building
	process
Message-ID: <90088e2bbd6e3129578b7d9d0758ad9a@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             03-21-2007 15:54 PDT
Last Modified:              03-22-2007 06:21 PDT
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

---------------------------------------------------------------------- 
 bernhardf - 03-22-07 06:21  
---------------------------------------------------------------------- 
Fixed in r18201 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-21-07 15:54  Franck78       New Issue                                    
03-21-07 15:54  Franck78       Status                   new => assigned     
03-21-07 15:54  Franck78       Assigned To               => buildroot       
03-21-07 15:54  Franck78       Issue Monitored: Franck78                    
03-22-07 06:21  bernhardf      Status                   assigned => closed  
03-22-07 06:21  bernhardf      Note Added: 0002268                          
======================================================================
