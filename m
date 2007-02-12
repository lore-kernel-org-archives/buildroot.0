From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:34:08 -0800
Subject: [Buildroot] [buildroot 0001090]: stdlibc++ fails putting a double
	in a stream.
Message-ID: <85cb46e7f0fc91843e8357a4225e773a@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1090 
====================================================================== 
Reported By:                GJanak
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1090
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-14-2006 00:01 PST
Last Modified:              02-12-2007 05:34 PST
====================================================================== 
Summary:                    stdlibc++ fails putting a double in a stream.
Description: 
The problem was:
putting a double in a stream:
cout << 10.5 ;

Produce an empty string, or some garbage characters.

I could resolve the error down to some wired Code combination between
uclibc and libstdc++
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-14-06 00:01  GJanak         New Issue                                    
11-14-06 00:01  GJanak         Status                   new => assigned     
11-14-06 00:01  GJanak         Assigned To               => uClibc          
11-14-06 00:05  GJanak         Issue Monitored: GJanak                      
02-12-07 05:34  vapier         Assigned To              uClibc => buildroot 
======================================================================
