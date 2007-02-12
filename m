From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:25 -0800
Subject: [Buildroot] [buildroot 0001151]: flex package fails
Message-ID: <ce663fdde60c964c8e59cfaaba098087@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1151 
====================================================================== 
Reported By:                Steven_Carr
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1151
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-09-2007 22:43 PST
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    flex package fails
Description: 
flex_2.5.4a.orig.tar.gz is no longer available from
http://ftp.debian.org/debian/pool/main/f/flex
need to uplevel to flex_2.5.33.orig.tar.gz
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 01-19-07 07:58  
---------------------------------------------------------------------- 
I fixed this proper in svn r17381. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-09-07 22:43  Steven_Carr    New Issue                                    
01-09-07 22:43  Steven_Carr    Status                   new => assigned     
01-09-07 22:43  Steven_Carr    Assigned To               => uClibc          
01-19-07 07:58  bernhardf      Status                   assigned => closed  
01-19-07 07:58  bernhardf      Note Added: 0001993                          
01-19-07 07:58  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
