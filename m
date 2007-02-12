From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:27 -0800
Subject: [Buildroot] [buildroot 0001055]: ccache-2.4 causes 'make clean' to
	fail
Message-ID: <1ccaf843eb79ddae3048e045d03a211d@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             09-27-2006 17:06 PDT
Last Modified:              02-12-2007 05:33 PST
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
======================================================================
