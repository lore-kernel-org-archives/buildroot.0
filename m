From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:49 -0800
Subject: [Buildroot] [buildroot 0000561]: DirectFB 0.9.22 no longer
	available, most recent version is 0.9.24
Message-ID: <d449c8e7af4f7bacd8ddeb650d1e726a@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=561 
====================================================================== 
Reported By:                crafterm
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   561
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-24-2005 06:14 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    DirectFB 0.9.22 no longer available, most recent
version is 0.9.24
Description: 
Hi There,

Hope all is going well.

When selecting the inclusion of directfb in the buildroot toolchain, it
attempts to download directfb 0.9.22, however this version no longer
exists at the directfb website. The current version is 0.9.24 however the
bundled patch against 0.9.22 unfortunately fails to apply against 0.9.24.

Cheers,

Marcus
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 11-24-05 11:53  
---------------------------------------------------------------------- 
upstream fixed the issue that patch addressed so it is no longer needed

0.9.24 is in svn now, thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-24-05 06:14  crafterm       New Issue                                    
11-24-05 06:14  crafterm       Status                   new => assigned     
11-24-05 06:14  crafterm       Assigned To               => uClibc          
11-24-05 11:53  vapier         Note Added: 0000695                          
11-24-05 11:53  vapier         Status                   assigned => closed  
11-24-05 11:53  vapier         Resolution               open => fixed       
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
