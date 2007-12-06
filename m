From: kevint <kevint@lanl.gov>
Date: Thu, 6 Dec 2007 13:59:07 -0700
Subject: [Buildroot] gcc-final rebuilt after failed kernel build
Message-ID: <2BE358E8-5E48-44C3-B3D8-1A6A49B63115@lanl.gov>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I noticed that if I have a failed kernel build (near end of buildroot  
make process), and I run make again, gcc-final is rebuilt.  I looked  
at the /toolchain_build_$ARCH gcc-final directory, and the .compiled  
and .installed files are placed, so I can't think of why this would  
happen.  Anyone know offhand?

Thanks,

********************************************
Kevin Tegtmeier
HPC-3 Scientific Computing Resources
Los Alamos National Laboratory
email:  kevint at lanl.gov
********************************************



-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071206/d2d084b0/attachment.htm 
