From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 10 Nov 2008 07:11:50 -0800
Subject: [Buildroot] [buildroot 0006064]: Making install in curl fails
Message-ID: <e997943a6efcf4ce87fededa5d3a1f27@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=6064 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   6064
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-10-2008 07:11 PST
Last Modified:              11-10-2008 07:11 PST
====================================================================== 
Summary:                    Making install in curl fails
Description: 
Making install in curl
make[6]: Entering directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1/include/curl'
make[7]: Entering directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1/include/curl'
make[7]: Nothing to be done for `install-exec-am'.
test -z "/usr/include/curl" || @MKDIR_P@
"/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/curl"
/bin/bash: @MKDIR_P@: command not found
make[7]: *** [install-pkgincludeHEADERS] Error 127
make[7]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1/include/curl'
make[6]: *** [install-am] Error 2
make[6]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1/include/curl'
make[5]: *** [install-recursive] Error 1
make[5]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1/include'
make[4]: *** [install-data-hook] Error 2
make[4]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1'
make[3]: *** [install-data-am] Error 2
make[3]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1'
make[2]: *** [install-am] Error 2
make[2]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1'
make[1]: *** [install-recursive] Error 1
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1'
make: ***
[/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/curl] Error
2

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-10-08 07:11  robang74       New Issue                                    
11-10-08 07:11  robang74       Status                   new => assigned     
11-10-08 07:11  robang74       Assigned To               => buildroot       
======================================================================
