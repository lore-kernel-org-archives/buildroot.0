From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 14 Nov 2008 22:02:45 -0800
Subject: [Buildroot] [buildroot 0006324]: xlib_libX11 does not compile any
	more
Message-ID: <eea8746e1a26f29164178603369ba66d@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=6324 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   6324
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-14-2008 21:58 PST
Last Modified:              11-14-2008 22:02 PST
====================================================================== 
Summary:                    xlib_libX11 does not compile any more
Description: 
/usr/bin/ld: this linker was not configured to use sysroots


====================================================================== 

---------------------------------------------------------------------- 
 robang74 - 11-14-08 22:02  
---------------------------------------------------------------------- 
i586-linux-uclibc-gcc:
/home/roberto/gles/buildroot/build_i586/staging_dir/lib: linker input file
unused because linking not done
i586-linux-uclibc-gcc: --rpath-link: linker input file unused because
linking not done
i586-linux-uclibc-gcc:
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib: linker input
file unused because linking not done 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-14-08 21:58  robang74       New Issue                                    
11-14-08 21:58  robang74       Status                   new => assigned     
11-14-08 21:58  robang74       Assigned To               => buildroot       
11-14-08 21:58  robang74       File Added: .config                          
11-14-08 22:02  robang74       Note Added: 0015864                          
======================================================================
