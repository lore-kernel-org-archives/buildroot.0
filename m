From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:17 -0800
Subject: [Buildroot] [buildroot 0000912]: FLOAT: Can't make -- bails with
	error: Unknown floating point type used in --with-float=no
Message-ID: <752acd7b67247ffa4e941a9f7b9bfe15@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=912 
====================================================================== 
Reported By:                bowerymarc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   912
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-19-2006 16:20 PDT
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    FLOAT: Can't make -- bails with error:  Unknown
floating point type used in --with-float=no
Description: 
trying to compile buildroot with GCC 4.2 and ARM920T (config file attached)
and getting this error every time:

checking for clock_t... yes
checking for .preinit_array/.init_array/.fini_array support... yes
checking if mkdir takes one argument... no
For  real value is
For  real value is
Unknown floating point type used in --with-float=no
make[1]: *** [configure-gcc] Error 1
make[1]: Leaving directory
`/home/marc/buildroot/toolchain_build_arm_nofpu/gcc-4.2-initial'
make: ***
[/home/marc/buildroot/toolchain_build_arm_nofpu/gcc-4.2-initial/.compiled]
Error 2

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 01-21-07 06:43  
---------------------------------------------------------------------- 
Can you retry with current trunk (revision 17434 or later) and let me know
if this works now for gcc-4.2, latest binutils and latest kernel-headers?

Thanks, 

---------------------------------------------------------------------- 
 bernhardf - 02-04-07 08:50  
---------------------------------------------------------------------- 
Ping. Please update, retry and let me know if that works any better now or
not. 

---------------------------------------------------------------------- 
 bowerymarc - 02-04-07 10:04  
---------------------------------------------------------------------- 
sorry, no can do.  This was part of a project using the Cirrus EP9315.  Due
to the total lack of support from Cirrus Logic, we switched to another
processor entirely. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-19-06 16:20  bowerymarc     New Issue                                    
06-19-06 16:20  bowerymarc     Status                   new => assigned     
06-19-06 16:20  bowerymarc     Assigned To               => uClibc          
06-19-06 16:20  bowerymarc     File Added: current.config                    
01-21-07 06:43  bernhardf      Note Added: 0002017                          
01-21-07 06:43  bernhardf      Status                   assigned => feedback
02-04-07 08:50  bernhardf      Note Added: 0002102                          
02-04-07 09:11  bernhardf      Summary                  Can't make -- bails with
error:  Unknown floating point type used in --with-float=no => FLOAT: Can't make
-- bails with error:  Unknown floating point type used in --with-float=no
02-04-07 10:04  bowerymarc     Note Added: 0002113                          
02-12-07 05:33  vapier         Status                   feedback => assigned
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
