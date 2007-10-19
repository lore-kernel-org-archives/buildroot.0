From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 19 Oct 2007 12:53:03 -0700
Subject: [Buildroot] [buildroot 0001533]: lockfile-progs 0.1.10 breaks in
	compilation - PATCH
Message-ID: <b55b11a56b7ecd8e4407652b565849bf@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1533 
====================================================================== 
Reported By:                sushisan
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1533
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             10-16-2007 14:20 PDT
Last Modified:              10-19-2007 12:53 PDT
====================================================================== 
Summary:                    lockfile-progs 0.1.10 breaks in compilation - PATCH
Description: 
lockfile-progs 0.1.10 breaks with this error:

undefined reference to `*rindex*'

This patch update the package to 0.1.11 and add a patch to solve this. 
====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 10-19-07 12:53  
---------------------------------------------------------------------- 
fixed in svn 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-16-07 14:20  sushisan       New Issue                                    
10-16-07 14:20  sushisan       Status                   new => assigned     
10-16-07 14:20  sushisan       Assigned To               => buildroot       
10-16-07 14:20  sushisan       File Added: br2-lockfile-progs.patch             
      
10-19-07 12:53  vanokuten      Status                   assigned => closed  
10-19-07 12:53  vanokuten      Note Added: 0002839                          
======================================================================
