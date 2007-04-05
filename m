From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 5 Apr 2007 02:45:48 -0700
Subject: [Buildroot] [buildroot 0001292]: fakeroot version 1.6.4 No longer
	existas at ftp.debian.org
Message-ID: <49b2000f810e4bbe101de2c4c98ae3dc@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1292 
====================================================================== 
Reported By:                thcobbs
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1292
Category:                   New Features
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     closed
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             03-27-2007 08:45 PDT
Last Modified:              04-05-2007 02:45 PDT
====================================================================== 
Summary:                    fakeroot version 1.6.4 No longer existas at
ftp.debian.org
Description: 
The most recent svn checkout of buildroot has an invalid fakeroot package
version.  Altered to 1.6.5 and buildroot works fine.
====================================================================== 

---------------------------------------------------------------------- 
 thcobbs - 03-27-07 08:48  
---------------------------------------------------------------------- 
Attached a working patch...  or you could just go and manually update your
file ;-) 

---------------------------------------------------------------------- 
 jacmet - 04-04-07 01:49  
---------------------------------------------------------------------- 
Thanks. Fixed in r18314 

---------------------------------------------------------------------- 
 bernhardf - 04-05-07 02:45  
---------------------------------------------------------------------- 
jacmet, please set fixed reports to "closed" and not to "resolved", thanks. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-27-07 08:45  thcobbs        New Issue                                    
03-27-07 08:45  thcobbs        Status                   new => assigned     
03-27-07 08:45  thcobbs        Assigned To               => buildroot       
03-27-07 08:47  thcobbs        File Added: fakeroot-doc.patch                   

03-27-07 08:47  thcobbs        Issue Monitored: thcobbs                     
03-27-07 08:48  thcobbs        Note Added: 0002288                          
04-04-07 01:49  jacmet         Status                   assigned => resolved
04-04-07 01:49  jacmet         Resolution               open => fixed       
04-04-07 01:49  jacmet         Note Added: 0002293                          
04-05-07 02:45  bernhardf      Status                   resolved => closed  
04-05-07 02:45  bernhardf      Note Added: 0002296                          
======================================================================
