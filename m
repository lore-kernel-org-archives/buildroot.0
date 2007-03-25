From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 25 Mar 2007 10:29:50 -0700
Subject: [Buildroot] [buildroot 0001288]: cannot build libstdc++
Message-ID: <36bb6c13190ca7a732ec76b0db826b88@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1288 
====================================================================== 
Reported By:                Franck78
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1288
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-25-2007 09:02 PDT
Last Modified:              03-25-2007 10:29 PDT
====================================================================== 
Summary:                    cannot build libstdc++
Description: 
Hello,
The following buildroot settings:
-binutils 2.17
-hostCC gcc4.02
-target toolchain= gcc4.20,g++
-uclibc 0.9.28.3

produce everytime the following error in build-gcc-4.2-final:

In file included from
/data/users/root/buildroot/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/include/bits/locale_facets.h:3034,
                 from
/data/users/root/buildroot/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/include/bits/basic_ios.h:44,
                 from
/data/users/root/buildroot/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/include/ios:50,
                 from
/data/users/root/buildroot/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/include/ostream:44,
                 from
/data/users/root/buildroot/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/include/bitset:59,
                 from
/data/users/root/buildroot/toolchain_build_i686/gcc-4.2-20061121/libstdc++-v3/include/precompiled/stdc++.h:52:
/data/users/root/buildroot/toolchain_build_i686/gcc-4.2-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/time_members.h:39:
error: definition of 'void std::__timepunct<_CharT>::__timepunct(size_t)'
is not in namespace enclosing 'std::__timepunct<_CharT>'

====================================================================== 

---------------------------------------------------------------------- 
 Franck78 - 03-25-07 10:29  
---------------------------------------------------------------------- 
Moving to gcc 4.1.2 works. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-25-07 09:02  Franck78       New Issue                                    
03-25-07 09:02  Franck78       Status                   new => assigned     
03-25-07 09:02  Franck78       Assigned To               => buildroot       
03-25-07 09:02  Franck78       File Added: logerror420                      
03-25-07 09:03  Franck78       Issue Monitored: Franck78                    
03-25-07 10:29  Franck78       Note Added: 0002279                          
======================================================================
