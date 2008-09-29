From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 29 Sep 2008 08:09:56 -0700
Subject: [Buildroot] [buildroot 0005184]: Building atngw100 fails due to
	missing mkimage
Message-ID: <250ba273f794876df16328880a95b571@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5184 
====================================================================== 
Reported By:                Anders Blomdell
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5184
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-29-2008 08:09 PDT
Last Modified:              09-29-2008 08:09 PDT
====================================================================== 
Summary:                    Building atngw100 fails due to missing mkimage
Description: 
Building atngw100 fails with:

  UIMAGE arch/avr32/boot/images/uImage
"mkimage" command not found - U-Boot images will not be built
  Image arch/avr32/boot/images/uImage is ready
make[1]: Leaving directory
`/local/src/avr32/buildroot/buildroot-20080925/project_build_avr32/atngw100/linux-2.6.24'
cp -pf
/local/src/avr32/buildroot/buildroot-20080925/project_build_avr32/atngw100/linux-2.6.24/arch/avr32/boot/images/uImage
/local/src/avr32/buildroot/buildroot-20080925/binaries/atngw100/atngw100-linux-2.6.24-20080929.gz
cp: cannot stat
`/local/src/avr32/buildroot/buildroot-20080925/project_build_avr32/atngw100/linux-2.6.24/arch/avr32/boot/images/uImage':
No such file or directory
make: ***
[/local/src/avr32/buildroot/buildroot-20080925/binaries/atngw100/atngw100-linux-2.6.24-20080929.gz]
Error 1

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-29-08 08:09  Anders BlomdellNew Issue                                    
09-29-08 08:09  Anders BlomdellStatus                   new => assigned     
09-29-08 08:09  Anders BlomdellAssigned To               => buildroot       
======================================================================
