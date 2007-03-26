From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 25 Mar 2007 17:25:32 -0700
Subject: [Buildroot] [buildroot 0001290]: linux header & libc header files
	should go in /usr/include
Message-ID: <c71e1e03b6f7982b66b7e3eb6656fb65@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1290 
====================================================================== 
Reported By:                Franck78
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1290
Category:                   Standards Compliance
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-25-2007 17:25 PDT
Last Modified:              03-25-2007 17:25 PDT
====================================================================== 
Summary:                    linux header & libc header files should go in
/usr/include
Description: 
Hello,
Inside the toolchain (fakeroot.0000), the header files (linux&uclibc) are
not in the correct subdir.
They reside in "/include" but should reside in "/usr/include"

It is annoying because the toolchain tools (gcc,cpp,..) look in "/include"
and package build with classic options (just a simple configure
--prefix=/usr) put them in what is correct for most of them,
"/usr/include".

I'm not absolute certain on the correct standart but what is sure, is that
there is no "/include" dir on my linuxes (ubuntu, mandrake, suse).


Franck
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-25-07 17:25  Franck78       New Issue                                    
03-25-07 17:25  Franck78       Status                   new => assigned     
03-25-07 17:25  Franck78       Assigned To               => buildroot       
======================================================================
