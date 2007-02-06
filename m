From: <bogus@does.not.exist.com>
Date: Tue, 06 Feb 2007 07:08:39 -0000
Subject: No subject
Message-ID: <mailman.0.1171287844.4267.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-e 's/^.*(.CC) \([0-9\.]\)/\1/g' -e "s/[-\ ].*//g"

What do you think? 

---------------------------------------------------------------------- 
 bernhardf - 11-28-06 02:08  
---------------------------------------------------------------------- 
fixed in r16703 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-20-06 17:47  alchemar       New Issue                                    
11-20-06 17:47  alchemar       Status                   new => assigned     
11-20-06 17:47  alchemar       Assigned To               => uClibc          
11-20-06 17:47  alchemar       File Added: dependencies.sh                    
11-22-06 13:16  bernhardf      Note Added: 0001770                          
11-22-06 15:41  alchemar       Note Added: 0001788                          
11-22-06 16:14  bernhardf      Note Added: 0001789                          
11-28-06 01:48  bernhardf      Note Added: 0001820                          
11-28-06 02:07  bernhardf      Relationship added       duplicate of 0000961
11-28-06 02:08  bernhardf      Status                   assigned => closed  
11-28-06 02:08  bernhardf      Note Added: 0001824                          
11-28-06 02:08  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================
