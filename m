From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:24 -0800
Subject: [Buildroot] [buildroot 0000646]: Buildroot can't download gcc
Message-ID: <1d5495541f41b3b7c4e5dfe4e183c022@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=646 
====================================================================== 
Reported By:                jslyster
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   646
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-17-2006 07:45 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    Buildroot can't download gcc
Description: 
Buildroot cannot download gcc because the server at mirrors.rcn.net isn't
up. mirrors.rcn.net hasn't been up for at least a week, and possibly much
more time than that.
====================================================================== 

---------------------------------------------------------------------- 
 scott - 01-18-06 08:17  
---------------------------------------------------------------------- 
This is what we are now using....

#GCC_SITE:=ftp://ftp.gnu.org/gnu/gcc/releases/gcc-$(GCC_VERSION)
#GCC_SITE:=http://mirrors.rcn.net/pub/sourceware/gcc/releases/gcc-$(GCC_VERSION)
GCC_SITE:=ftp://mirrors.laffeycomputer.com/pub/gcc.gnu.org/pub/gcc/releases/gcc-$(GCC_VERSION)


---------------------------------------------------------------------- 
 prpplague - 01-19-06 07:08  
---------------------------------------------------------------------- 
GCC_SITE:=ftp://ftp.ibiblio.org/pub/mirrors/gnu/ftp/gnu/gcc/gcc-$(GCC_VERSION)

was fixed with 13394 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-17-06 07:45  jslyster       New Issue                                    
01-17-06 07:45  jslyster       Status                   new => assigned     
01-17-06 07:45  jslyster       Assigned To               => uClibc          
01-18-06 08:17  scott          Note Added: 0000946                          
01-19-06 07:08  prpplague      Note Added: 0000954                          
01-19-06 07:08  prpplague      Status                   assigned => closed  
01-19-06 07:08  prpplague      Resolution               open => fixed       
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
