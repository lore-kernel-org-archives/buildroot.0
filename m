From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:30 -0800
Subject: [Buildroot] [buildroot 0000171]: openvpn: wrong Path for
	libcrypto.so
Message-ID: <f21d971af1a46773f659d23a6e43ac21@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=171 
====================================================================== 
Reported By:                Cy8aer
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   171
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-18-2005 12:27 PST
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    openvpn: wrong Path for libcrypto.so
Description: 
Buildroot fails for compiling openvpn with default settings of svn.
There shoud be the path
buildroot/build_i386/staging_dir/bin-ccache/../lib/gcc/i386-linux-uclibc/3.4.3/../../../i386-linux-uclibc/libcrypto.so
so there may be one ../ to much

====================================================================== 

---------------------------------------------------------------------- 
 Cy8aer - 03-28-05 09:45  
---------------------------------------------------------------------- 
openvpn compilation works for me with svn revision 10059 (new version of
openssl). The compilation works with openvpn 2 release candidate as well. 

---------------------------------------------------------------------- 
 prpplague - 02-10-06 10:51  
---------------------------------------------------------------------- 
due to a dead period of no maintence on the case log, this issue was left
sitting.  if this is still an issue against the current svn pull, please
submit a new case. if you choose to submit a patch, please use a diff -urN
format 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-18-05 12:27  Cy8aer         New Issue                                    
03-28-05 09:45  Cy8aer         Note Added: 0000119                          
02-10-06 10:51  prpplague      Note Added: 0001081                          
02-10-06 10:51  prpplague      Status                   assigned => closed  
02-10-06 10:51  prpplague      Resolution               open => won't fix   
02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
