From: <bogus@does.not.exist.com>
Date: Tue, 06 Feb 2007 07:08:39 -0000
Subject: No subject
Message-ID: <mailman.3.1171288604.4267.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

make[1]: Leaving directory `/tmp/buildroot/package/config'
package/Config.in:33: can't open file "package/config/Config.in"
make: *** [menuconfig] Error 1

Adding Config.h fomr a cvs ckeckout fixed it.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 03-20-05 18:38  
---------------------------------------------------------------------- 
works fine for me ...

i turned on these options under packages:
[*] DHCP support
[*]  dhcp server
[*]  dhcp relay
[*]  dhcp client 

---------------------------------------------------------------------- 
 thomasez - 03-31-05 11:22  
---------------------------------------------------------------------- 
It has obviously been fixed. This bug should be closed (Yes, I tested this
now aswell). 

---------------------------------------------------------------------- 
 vapier - 03-31-05 12:02  
---------------------------------------------------------------------- 
sounds good 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-10-05 13:53  thomasez       New Issue                                    
03-16-05 12:13  andersen       Status                   new => assigned     
03-16-05 12:13  andersen       Assigned To               => uClibc          
03-20-05 18:38  vapier         Note Added: 0000109                          
03-31-05 11:22  thomasez       Note Added: 0000121                          
03-31-05 12:02  vapier         Status                   assigned => closed  
03-31-05 12:02  vapier         Note Added: 0000122                          
02-12-07 05:51  vapier         Status                   closed => assigned  
02-12-07 05:51  vapier         Assigned To              uClibc => buildroot 
======================================================================
