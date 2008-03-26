From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 25 Mar 2008 20:33:46 -0700
Subject: [Buildroot] [buildroot 0002574]: Tell SVN to ignore ".auto.deps"
Message-ID: <3bc26505b0e0afb3ac23da29bafa3215@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been RESOLVED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2574 
====================================================================== 
Reported By:                mth
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2574
Category:                   Other
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     resolved
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             03-13-2008 19:01 PDT
Last Modified:              03-25-2008 20:33 PDT
====================================================================== 
Summary:                    Tell SVN to ignore ".auto.deps"
Description: 
The file ".auto.deps" is automatically generated, but it is not in the
svn:ignore property of the top-level dir, so it pollutes the "svn st"
output. Please add it to the ignore list.

====================================================================== 

---------------------------------------------------------------------- 
 hmoffatt - 03-25-08 20:33  
---------------------------------------------------------------------- 
Done 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-13-08 19:01  mth            New Issue                                    
03-13-08 19:01  mth            Status                   new => assigned     
03-13-08 19:01  mth            Assigned To               => buildroot       
03-25-08 20:33  hmoffatt       Status                   assigned => resolved
03-25-08 20:33  hmoffatt       Resolution               open => fixed       
03-25-08 20:33  hmoffatt       Note Added: 0005924                          
======================================================================
