From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 15 Jun 2008 14:07:27 -0700
Subject: [Buildroot] [buildroot 0003754]: dnsmasq fails to link on i686
	platforms
Message-ID: <7e1ba59f982d62b0221eefcab98fc590@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3754 
====================================================================== 
Reported By:                KHAksnes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3754
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-14-2008 17:01 PDT
Last Modified:              06-15-2008 14:07 PDT
====================================================================== 
Summary:                    dnsmasq fails to link on i686 platforms
Description: 
dnsmask insists on loading libdbus-1.so from /lib instead of
build_i686/staging_dir/usr/lib ending with linking failure as expected.
I am using svn version 22342 of buildroot.
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 06-15-08 13:40  
---------------------------------------------------------------------- 
I cannot reproduce it on ppc, please provide more details 

---------------------------------------------------------------------- 
 KHAksnes - 06-15-08 14:07  
---------------------------------------------------------------------- 
A compile log ( after doing rm -rf build_i686/dnsmasq* )
are uploaded 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-14-08 17:01  KHAksnes       New Issue                                    
06-14-08 17:01  KHAksnes       Status                   new => assigned     
06-14-08 17:01  KHAksnes       Assigned To               => buildroot       
06-15-08 13:40  jacmet         Note Added: 0008264                          
06-15-08 14:07  KHAksnes       Note Added: 0008274                          
======================================================================
