From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:34:07 -0800
Subject: [Buildroot] [buildroot 0001101]: Build of Ruby crashes when its
	version is different from the host Ruby version
Message-ID: <1a792e663306bd921e238487d4259182@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1101 
====================================================================== 
Reported By:                znmeb
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1101
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-22-2006 17:03 PST
Last Modified:              02-12-2007 05:34 PST
====================================================================== 
Summary:                    Build of Ruby crashes when its version is different
from the host Ruby version
Description: 
I have a system with Ruby 1.8.5 installed. When I try to build the Ruby in
"buildroot", which is 1.8.2, it throws an error. Apparently part of the
build uses the host Ruby installation. I'm going to dig into this further,
but in the meantime, changing the version of Ruby in target/ruby/ruby.mk
allows Ruby to build successfully.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-22-06 17:03  znmeb          New Issue                                    
11-22-06 17:03  znmeb          Status                   new => assigned     
11-22-06 17:03  znmeb          Assigned To               => uClibc          
11-22-06 17:04  znmeb          Issue Monitored: znmeb                       
02-12-07 05:34  vapier         Assigned To              uClibc => buildroot 
======================================================================
