From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 18 Jun 2008 06:06:42 -0700
Subject: [Buildroot] [buildroot 0003754]: dnsmasq fails to link on i686
	platforms
Message-ID: <8ff1d6082f8d792bb52267a3b07e1ad9@busybox.net>
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
Last Modified:              06-18-2008 06:06 PDT
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

---------------------------------------------------------------------- 
 jacmet - 06-18-08 06:06  
---------------------------------------------------------------------- 
