From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 26 Mar 2008 01:42:31 -0700
Subject: [Buildroot] [buildroot 0002514]: fakeroot has an invalid version
Message-ID: <56bb6e14d55f77573533f80920d498d2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=2514 
====================================================================== 
Reported By:                sg
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2514
Category:                   Other
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     closed
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             03-10-2008 19:28 PDT
Last Modified:              03-26-2008 01:42 PDT
====================================================================== 
Summary:                    fakeroot has an invalid version
Description: 
The version of fakeroot demanded by the current buildroot in
package/fakeroot/fakeroot.mk is 1.9. That version does not exist on
debain.org. The closest matching version is 1.9.3. However, the patch file
"fakeroot-revert-ltmain.patch" fails to apply against that version.
====================================================================== 

---------------------------------------------------------------------- 
 hmoffatt - 03-25-08 20:45  
---------------------------------------------------------------------- 
This has been fixed (not by me). 

---------------------------------------------------------------------- 
 bernhardf - 03-26-08 01:42  
---------------------------------------------------------------------- 
hmoffatt,

Please *close* bugs (don't set them to resolved).

TIA for fixing all other states you ment to close yesterday. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-10-08 19:28  sg             New Issue                                    
03-10-08 19:28  sg             Status                   new => assigned     
03-10-08 19:28  sg             Assigned To               => buildroot       
03-11-08 03:09  johaahn        Issue Monitored: johaahn                     
03-11-08 07:40  grindars       Issue Monitored: grindars                    
03-25-08 20:45  hmoffatt       Status                   assigned => resolved
03-25-08 20:45  hmoffatt       Resolution               open => fixed       
03-25-08 20:45  hmoffatt       Note Added: 0005954                          
03-26-08 01:42  bernhardf      Status                   resolved => closed  
03-26-08 01:42  bernhardf      Note Added: 0005974                          
======================================================================
