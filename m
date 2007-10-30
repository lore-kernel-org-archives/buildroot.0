From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 30 Oct 2007 12:05:13 -0700
Subject: [Buildroot] [buildroot 0001564]: Don't build toolchain in build
	20330
Message-ID: <c157febc12b98f462efd0cf698127c0d@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1564 
====================================================================== 
Reported By:                sushisan
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1564
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-30-2007 09:30 PDT
Last Modified:              10-30-2007 12:05 PDT
====================================================================== 
Summary:                    Don't build toolchain in build 20330
Description: 
After a make menuconfig a simple make try to compile the selected packages
BUT the toolchains are not compile!! (Don't start compiling gcc neither
others tools)
====================================================================== 

---------------------------------------------------------------------- 
 UlfSamuelsson - 10-30-07 12:05  
---------------------------------------------------------------------- 
It seems to work ok, if "package/kismet/kismet.mk" is renamed
to "package/kismet/kismet.mkx", removing it from the build,
so the new package kismet seems to be the culprit. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-30-07 09:30  sushisan       New Issue                                    
10-30-07 09:30  sushisan       Status                   new => assigned     
10-30-07 09:30  sushisan       Assigned To               => buildroot       
10-30-07 12:05  UlfSamuelsson  Note Added: 0002876                          
======================================================================
