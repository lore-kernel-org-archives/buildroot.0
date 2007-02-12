From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:34:14 -0800
Subject: [Buildroot] [buildroot 0001027]: problem in cramfs endianness patch
	when padding enabled
Message-ID: <ff04c614e2733430d1d42dad2c2ab85f@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1027 
====================================================================== 
Reported By:                raburton
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1027
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-12-2006 06:43 PDT
Last Modified:              02-12-2007 05:34 PST
====================================================================== 
Summary:                    problem in cramfs endianness patch when padding
enabled
Description: 
The endianness patch for cramfs should allow the cramfsck command to
process images of either endianness transparently. However it cannot
handle images of the opposite endianness to the host that have padding
enabled (built with the -p option).

I have attached a replacement cramfs-02-endian.patch (rather than a patch
against the patch) that fixes this issue, but is otherwise identical to
the original.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-12-06 06:43  raburton       New Issue                                    
09-12-06 06:43  raburton       Status                   new => assigned     
09-12-06 06:43  raburton       Assigned To               => uClibc          
09-12-06 06:43  raburton       File Added: new-cramfs-02-endian.patch           
        
09-12-06 06:44  raburton       Issue Monitored: raburton                    
02-12-07 05:34  vapier         Assigned To              uClibc => buildroot 
======================================================================
