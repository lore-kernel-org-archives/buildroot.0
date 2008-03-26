From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 25 Mar 2008 20:45:46 -0700
Subject: [Buildroot] [buildroot 0002514]: fakeroot has an invalid version
Message-ID: <617ed101296bc81ef9994c83cb95ba64@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been RESOLVED. 
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
Status:                     resolved
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             03-10-2008 19:28 PDT
Last Modified:              03-25-2008 20:45 PDT
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
======================================================================
