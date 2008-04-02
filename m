From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 2 Apr 2008 06:54:14 -0700
Subject: [Buildroot] [buildroot 0002724]: freetype-2.3.5 configure fails
Message-ID: <ce5cd726afa2774179d4f634092bf1c9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2724 
====================================================================== 
Reported By:                seek
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2724
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-02-2008 06:54 PDT
Last Modified:              04-02-2008 06:54 PDT
====================================================================== 
Summary:                    freetype-2.3.5 configure fails
Description: 
Building of freetype-2.3.5 stops with this error:

checking for x86_64-pc-linux-gnu-gcc... x86_64-pc-linux-gnu
checking for x86_64-pc-linux-gnu-gcc... (cached) x86_64-pc-linux-gnu
checking for x86_64-pc-linux-gnu-gcc... (cached) x86_64-pc-linux-gnu
checking for suffix of native executables... ./configure: line 3392:
x86_64-pc-linux-gnu: command not found
configure: error: native C compiler is not working
make[1]: *** [setup] Fehler 1

freetype-2.2.1 works as expected.



====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-02-08 06:54  seek           New Issue                                    
04-02-08 06:54  seek           Status                   new => assigned     
04-02-08 06:54  seek           Assigned To               => buildroot       
======================================================================
