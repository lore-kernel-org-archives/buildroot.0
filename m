From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 20 Jan 2008 18:45:30 -0800
Subject: [Buildroot] [buildroot 0001944]: gcc copiled by buildroot can not
	support "-gcov" feature.
Message-ID: <6e1f8e259264586b70e326e415e1536a@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1944 
====================================================================== 
Reported By:                jacky_deng
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1944
Category:                   Standards Compliance
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-20-2008 18:41 PST
Last Modified:              01-20-2008 18:45 PST
====================================================================== 
Summary:                    gcc copiled by buildroot can not support "-gcov"
feature.
Description: 
I wanna check the code coverage in a system.So I do as the following steps
1. gcc -fprofile-arcs -ftest-coverage -lgcov -o test -g test.c
2. No error during compile the file period. The target file "test" and
"test.gcno" can be successfully generated.
3. Then I run the program $./test
Expect:
  The program can run successfuly and a file "test.gcda" would be created
automatically.
Actually:
  The program can run successfully, But the file test.gcda didn't be
created.


====================================================================== 

---------------------------------------------------------------------- 
 jacky_deng - 01-20-08 18:45  
---------------------------------------------------------------------- 
The gcc compiled by buildroot. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-20-08 18:41  jacky_deng     New Issue                                    
01-20-08 18:41  jacky_deng     Status                   new => assigned     
01-20-08 18:41  jacky_deng     Assigned To               => buildroot       
01-20-08 18:45  jacky_deng     Issue Monitored: jacky_deng                    
01-20-08 18:45  jacky_deng     Note Added: 0003459                          
======================================================================
