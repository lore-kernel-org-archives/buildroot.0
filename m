From: kevint <kevint@lanl.gov>
Date: Mon, 13 Aug 2007 15:41:45 -0700
Subject: [Buildroot] multilib on x86_64 target
Message-ID: <BFA49114-30AE-4B0C-B5DD-B4FA27ED3F3D@lanl.gov>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am building a package that requires 32 and 64 bit libraries (-m32  
and -m64 options).  As far as I know, this requires gcc to be built  
with multilib support.

I noticed on the bug tracker that ticket IDs 909 and 1045 identify  
the same problem, but they are closed because multilib is not  
supported.  Are there any updates to this, and is there a reason why  
multilib is not supported?  Can you suggest a workaround?

Thanks,

********************************************
Kevin Tegtmeier
HPC-3 Scientific Computing Resources
Los Alamos National Laboratory
email:  kevint at lanl.gov
********************************************



-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070813/e8df2db6/attachment.htm 
