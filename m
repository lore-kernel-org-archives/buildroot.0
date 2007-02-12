From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:05 -0800
Subject: [Buildroot] [buildroot 0000588]: When I tried to compile buildroot
	with Xorg enabled I have an error
Message-ID: <47cb1b34a7e4ed19408f3cb7c70adf79@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=588 
====================================================================== 
Reported By:                invaugen
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   588
Category:                   New Features
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-07-2005 16:40 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    When I tried to compile buildroot with Xorg enabled
I have an error
Description: 
I download buildroot today but when I tried to compiled I have several
error:

../../exports/lib/libXt.so: undefined reference to `pthread_cond_signal'
../../exports/lib/libXt.so: undefined reference to `pthread_equal'
../../exports/lib/libX11.so: undefined reference to
`pthread_cond_broadcast'
../../exports/lib/libXt.so: undefined reference to `pthread_cond_init'
../../exports/lib/libXt.so: undefined reference to `pthread_mutex_unlock'
../../exports/lib/libXt.so: undefined reference to `pthread_self'
../../exports/lib/libXt.so: undefined reference to
`pthread_mutex_destroy'
../../exports/lib/libXt.so: undefined reference to `pthread_mutex_lock'
../../exports/lib/libXt.so: undefined reference to `pthread_cond_wait'
../../exports/lib/libXt.so: undefined reference to `pthread_cond_destroy'
../../exports/lib/libXt.so: undefined reference to `pthread_mutex_init'
collect2: ld returned 1 exit status
make[5]: *** [appres] Error 1

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-07-05 16:40  invaugen       New Issue                                    
12-07-05 16:40  invaugen       Status                   new => assigned     
12-07-05 16:40  invaugen       Assigned To               => uClibc          
12-07-05 16:40  invaugen       File Added: xorg.tar.gz                      
01-03-06 17:11  invaugen       Issue Monitored: invaugen                    
01-23-06 12:18  prpplague      Status                   assigned => closed  
01-23-06 12:18  prpplague      Resolution               open => unable to
reproduce
01-23-06 12:18  prpplague      Additional Information Updated                   

02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
