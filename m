From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 20 Mar 2007 15:37:01 -0700
Subject: [Buildroot] [buildroot 0001279]: bad compiler version discover in
	dependencies.sh
Message-ID: <857a9f5378ecf80a9370db62c2c3c60b@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1279 
====================================================================== 
Reported By:                Franck78
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1279
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-20-2007 15:19 PDT
Last Modified:              03-20-2007 15:37 PDT
====================================================================== 
Summary:                    bad compiler version discover in dependencies.sh
Description: 
Hello,
I don't know wheter or not $HOSTCC have to be defined before lauching
'make'.

Anyway, when not configured, the following test fails:
COMPILER=$(which $HOSTCC)

'which' gracefully respond with helps text....
that next $XSED is unable to understand ;)

file:
toolchain/dependencies/dependencies.sh; line
http://busybox.net/bugs/view.php?id=208#152


Bye
====================================================================== 

---------------------------------------------------------------------- 
 Franck78 - 03-20-07 15:37  
---------------------------------------------------------------------- 
same for $HOSTCXX, next test.

Note also 'head' is used before testing presence by the script. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-20-07 15:19  Franck78       New Issue                                    
03-20-07 15:19  Franck78       Status                   new => assigned     
03-20-07 15:19  Franck78       Assigned To               => buildroot       
03-20-07 15:20  Franck78       Issue Monitored: Franck78                    
03-20-07 15:37  Franck78       Note Added: 0002259                          
======================================================================
