From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:55 -0800
Subject: [Buildroot] [buildroot 0000564]: g++ tools fails to build with
	gcc-3.3.5, binutils 2.15.97
Message-ID: <3c9f85992f311eaca0b446cc2d7c071c@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=564 
====================================================================== 
Reported By:                crafterm
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   564
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-25-2005 11:25 PST
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    g++ tools fails to build with gcc-3.3.5, binutils
2.15.97
Description: 
Hi All,

Hope all is going well.

Attached is the end of a build log when building the buildroot toolchain
including C++ compiler/stdc++ lib, etc.

Unfortunately due to a parse error the build fails:

/home/crafterm/workspace/build/buildroot/toolchain_build_i386/gcc-3.3.5-final/i386-linux-uclibc/libstdc++-v3/include/i386-linux-uclibc/bits/codecvt_specializations.h:52:
error: parse
   error before `;' token
/home/crafterm/workspace/build/buildroot/toolchain_build_i386/gcc-3.3.5-final/i386-linux-uclibc/libstdc++-v3/include/i386-linux-uclibc/bits/codecvt_specializations.h:64:
error: '
   __desc_type' is used as a type, but is not defined as a type.


Cheers,

Marcus
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 01-21-07 06:47  
---------------------------------------------------------------------- 
This works with gcc-4(.2), so closing this report.
Please let us know if you experience problems with a current toolchain,
TIA. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-25-05 11:25  crafterm       New Issue                                    
11-25-05 11:25  crafterm       Status                   new => assigned     
11-25-05 11:25  crafterm       Assigned To               => uClibc          
11-25-05 11:25  crafterm       File Added: buildlog.txt                     
01-21-07 06:47  bernhardf      Status                   assigned => closed  
01-21-07 06:47  bernhardf      Note Added: 0002019                          
01-21-07 06:47  bernhardf      Resolution               open => won't fix   
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
