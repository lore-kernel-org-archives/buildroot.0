From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 10 Mar 2008 19:28:01 -0700
Subject: [Buildroot] [buildroot 0002514]: fakeroot has an invalid version
Message-ID: <3602fa0f2bfc9d33e7fe0380c3243a05@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             03-10-2008 19:28 PDT
Last Modified:              03-10-2008 19:28 PDT
====================================================================== 
Summary:                    fakeroot has an invalid version
Description: 
The version of fakeroot demanded by the current buildroot in
package/fakeroot/fakeroot.mk is 1.9. That version does not exist on
debain.org. The closest matching version is 1.9.3. However, the patch file
"fakeroot-revert-ltmain.patch" fails to apply against that version.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-10-08 19:28  sg             New Issue                                    
03-10-08 19:28  sg             Status                   new => assigned     
03-10-08 19:28  sg             Assigned To               => buildroot       
======================================================================
