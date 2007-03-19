From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 19 Mar 2007 03:50:00 -0700
Subject: [Buildroot] [buildroot 0001277]: LINUX_VERSION refrences itself
Message-ID: <90ce87c41776967be56bfb0407738015@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1277 
====================================================================== 
Reported By:                nevr
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1277
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             03-19-2007 02:11 PDT
Last Modified:              03-19-2007 03:50 PDT
====================================================================== 
Summary:                    LINUX_VERSION refrences itself
Description: 
in target/linux26.mk:44 LINUX_VERSION is set to equal to $(LINUX_VERSION)
make errors out with recursion errors.  Not sure what it should be set to,
still trying to understand all the internals of buildroot, so no patch
posted, hopefully someone else will be able to figure it out.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 03-19-07 03:50  
---------------------------------------------------------------------- 
Fixed in r18157. Thanks for pointing this out. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-19-07 02:11  nevr           New Issue                                    
03-19-07 02:11  nevr           Status                   new => assigned     
03-19-07 02:11  nevr           Assigned To               => buildroot       
03-19-07 03:49  bernhardf      Status                   assigned => closed  
03-19-07 03:50  bernhardf      Note Added: 0002244                          
======================================================================
