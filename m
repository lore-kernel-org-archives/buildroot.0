From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:08 -0800
Subject: [Buildroot] [buildroot 0000566]: [patch] ruby 1.8 support for
	buildroot
Message-ID: <a1923d4765072c7c53a155a15596a959@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=566 
====================================================================== 
Reported By:                crafterm
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   566
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-29-2005 05:41 PST
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    [patch] ruby 1.8 support for buildroot
Description: 
Hi All,

Hope all is going well.

Attached is the first support for building ruby within buildroot.

The tar file includes the package directory related files (ie. ruby.mk and
Config.in) and the diff is to the package/Config.in file to enable support
during a make menuconfig.

Cheers,

Marcus
====================================================================== 

---------------------------------------------------------------------- 
 crafterm - 12-14-05 09:35  
---------------------------------------------------------------------- 
Updated the ruby archive to install Ruby 1.8.2. Ruby 1.8.3 has issues with
IO, in particular the following script results in error.

File.open("/tmp/test.txt", 'rb') {|r|
  puts r.read(1024)
}

Also fixed in Ruby 1.8.4pre2. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-29-05 05:41  crafterm       New Issue                                    
11-29-05 05:41  crafterm       Status                   new => assigned     
11-29-05 05:41  crafterm       Assigned To               => uClibc          
11-29-05 05:41  crafterm       File Added: ruby.tar.gz                      
11-29-05 05:42  crafterm       File Added: config.in.ruby.patch                 
  
12-14-05 09:35  crafterm       Note Added: 0000761                          
12-14-05 09:50  crafterm       File Added: ruby-updated-20051214.tar.gz         
          
01-23-06 12:24  prpplague      Status                   assigned => resolved
01-23-06 12:24  prpplague      Resolution               open => fixed       
01-23-06 12:24  prpplague      Additional Information Updated                   

03-08-06 16:55  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
