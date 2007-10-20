From: sathesh babu <sathesh_edara2003@yahoo.co.in>
Date: Sat, 20 Oct 2007 09:07:07 +0100 (BST)
Subject: [Buildroot] MIPS Crosstoolchain for MIPS24K with dsp amd 24k
	compiler options
In-Reply-To: <Pine.LNX.4.64N.0710192135440.13279@blysk.ds.pg.gda.pl>
Message-ID: <712862.82132.qm@web7908.mail.in.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 
   
  I would like to build cross toolchain for MIPS24K processor with "-mdsp" and
   "-m24k" compile flag options for linux-2.6.18.8 kernel.
   
  I tried with below combinations of
  - GCC-4.2.1,GCC-4.0.1, GCC-4.1.0
  - binutils-2.15, binutil-2.17,binutil-2.18 
  -  uClibc-0.9.27 
  but i couldn't succeed any of the above combinations.
   
  I checked the mailing list and it is mentioned that GCC-4.2.x version of gcc has problems.
   
  Could you please guide me the, the exact versions of
   - GCC 
   - binutils
   - ucLibc
  to be used to build toolchain with "-mdsp" and "-m24k" compiler options for linux-2.6.18.8 kernel version.
   
  Thanks. 
   
  Regards,
  Sathesh

       
---------------------------------
 Bollywood, fun, friendship, sports and more. You name it,  we have it.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071020/dfe3f6eb/attachment.htm 
