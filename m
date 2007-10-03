From: sathesh babu <sathesh_edara2003@yahoo.co.in>
Date: Wed, 3 Oct 2007 18:09:26 +0100 (BST)
Subject: [Buildroot] Building libgcc with -G 0 options
Message-ID: <557489.49105.qm@web7903.mail.in.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
    I am using buildroot to build toolchain( GCC ver 3.4.3, binutil-1.15 and ucLibc-0.9.28, linux-2.6.18 kernel)  for MIPS processor.
  While building the toolchain i enabled soft float option.
  I have written a loadble module ( which gets complie along with kernel) which does some floating point operation.
   
  When i try to load the module i get the following error
  "unresoved symbol _gp_disp".
   
  In fact i tried with -mno-abicalls -fno-pic  compiler options still i see the same problem.
   
  Could you please give me some pointers on this issue.
  BTW, How to compile libgcc.a with "-G 0" options.
  In which file of buildroot i shoul added these options to get effective.
   
  Thanks in advance.
   
  Regards,
  Sathesh
   

       
---------------------------------
 Now you can chat without downloading messenger. Click here to know how.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071003/5483823c/attachment.htm 
