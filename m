From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 19 Sep 2007 07:03:51 -0700
Subject: [Buildroot] [buildroot 0001503]: lighttpd with wrong download
	version
Message-ID: <ac45efccc3a637fd06b4432abf101779@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1503 
====================================================================== 
Reported By:                MikeGerth
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1503
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             09-19-2007 06:48 PDT
Last Modified:              09-19-2007 07:03 PDT
====================================================================== 
Summary:                    lighttpd with wrong download version
Description: 
package/lighttpd/lighttpd.mk has wrong LIGHTTPD_VERSION
is 1.4.16
must be 1.4.18

1.4.16 is not availlable there
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 09-19-07 07:03  
---------------------------------------------------------------------- 
Fixed in r19891. Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-19-07 06:48  MikeGerth      New Issue                                    
09-19-07 06:48  MikeGerth      Status                   new => assigned     
09-19-07 06:48  MikeGerth      Assigned To               => buildroot       
09-19-07 07:03  bernhardf      Status                   assigned => closed  
09-19-07 07:03  bernhardf      Note Added: 0002753                          
======================================================================
