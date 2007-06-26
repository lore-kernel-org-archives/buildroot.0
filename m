From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 26 Jun 2007 07:05:45 -0700
Subject: [Buildroot] [buildroot 0001055]: ccache-2.4 causes 'make clean' to
	fail
Message-ID: <af4eaa6a4e4a4e6d88a1d924d50bcc9a@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1055 
====================================================================== 
Reported By:                agaffney
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1055
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             09-27-2006 17:06 PDT
Last Modified:              06-26-2007 07:05 PDT
====================================================================== 
Summary:                    ccache-2.4 causes 'make clean' to fail
Description: 
When running 'make clean' from the root of my buildroot svn checkout, I
get:

make -j4 -C /root/405gp/buildroot/toolchain_build_powerpc_nofpu/ccache-2.4
uninstall
make[1]: Entering directory
`/root/405gp/buildroot/toolchain_build_powerpc_nofpu/ccache-2.4'
make[1]: *** No rule to make target `uninstall'.  Stop.
make[1]: Leaving directory
`/root/405gp/buildroot/toolchain_build_powerpc_nofpu/ccache-2.4'
make: *** [ccache-clean] Error 2

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 02-04-07 09:05  
---------------------------------------------------------------------- 
Should be fixed by andersee yesterday. Please retest. 

---------------------------------------------------------------------- 
 bernhardf - 06-26-07 07:05  
---------------------------------------------------------------------- 
apparently this was already fixed in the meantime. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-27-06 17:06  agaffney       New Issue                                    
09-27-06 17:06  agaffney       Status                   new => assigned     
09-27-06 17:06  agaffney       Assigned To               => uClibc          
10-09-06 12:20  jruere         Issue Monitored: jruere                      
02-04-07 09:05  bernhardf      Note Added: 0002104                          
02-04-07 09:05  bernhardf      Status                   assigned => feedback
02-12-07 05:33  vapier         Status                   feedback => assigned
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
06-26-07 07:05  bernhardf      Status                   assigned => closed  
06-26-07 07:05  bernhardf      Note Added: 0002520                          
======================================================================
