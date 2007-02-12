From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:20 -0800
Subject: [Buildroot] [buildroot 0001073]: Buildroot compilation failure
Message-ID: <106f693ad93efb85e1eb7443a5b00d56@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1073 
====================================================================== 
Reported By:                benakiva
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1073
Category:                   Other
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-14-2006 07:53 PDT
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    Buildroot compilation failure
Description: 
Buildroot compilation fails because of missing file busybox/Rules.mak can't
be found in busybox snapshots. However, this file exists into busybox-1.2.1
release version.
====================================================================== 

---------------------------------------------------------------------- 
 benakiva - 10-14-06 08:10  
---------------------------------------------------------------------- 
This problem occured to me when compiling buildroot for powerpc
architecture. Even, when I copy Rules.mak from busybox-1.2.1 into the
busybox-snapshot I'm using it does not solve the problem. 

---------------------------------------------------------------------- 
 benoitcosials - 11-04-06 15:58  
---------------------------------------------------------------------- 
Hi,

I saw in the CVSweb that we lost Rules.mak between 16306 and 16307.
Last version of the files are 16170.

I used it to compile buildroot snapshot(05-Nov-2006) from LFS live cd with
success. Options: linux 2.6.12, gcc 4.1.1, binutils 2.17

May some CVS maintainers could say why this file was removed please ? 

---------------------------------------------------------------------- 
 bernhardf - 11-22-06 14:10  
---------------------------------------------------------------------- 
This was already fixed. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-14-06 07:53  benakiva       New Issue                                    
10-14-06 07:53  benakiva       Status                   new => assigned     
10-14-06 07:53  benakiva       Assigned To               => uClibc          
10-14-06 08:04  benakiva       Issue Monitored: benakiva                    
10-14-06 08:08  benakiva       File Added: bug.txt                          
10-14-06 08:10  benakiva       Note Added: 0001702                          
10-30-06 16:03  zyqwert        Issue Monitored: zyqwert                     
11-04-06 15:58  benoitcosials  Note Added: 0001730                          
11-04-06 15:59  benoitcosials  Issue Monitored: benoitcosials                   

11-14-06 23:34  najib          Issue Monitored: najib                       
11-22-06 14:10  bernhardf      Status                   assigned => closed  
11-22-06 14:10  bernhardf      Note Added: 0001778                          
11-22-06 14:10  bernhardf      Resolution               open => no change
required
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
