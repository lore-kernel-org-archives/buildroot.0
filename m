From: Liu Oyster <oysterliu@gmail.com>
Date: Tue, 16 Jan 2007 12:08:52 +0800
Subject: [Buildroot] Using buildroot to compiler the busybox,
	but it could not run !!
Message-ID: <1d702dd10701152008m1f3b4715ibf7162363882b9aa@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi, Dear :
  I use the buildroot and busybox recently. But, I encountered some
questions, please help me.
  (1) buildroot : 0.9.27  , busybox : 1.0.0.rc2
  (2) linux kernel header version 2.4.25
       binutil : 2.25.91.0.02
       gcc : 3.4.2
   I run the "make menuconfig " at buildroot directory to set these fields.
Then run "make " and it produced the root_fs_i386.ext2. And I checked the
build_i386/busybox-1.0.0  directory, busybox file is generated, but I could
run the file "busybox".

   If I did not use the buildroot toolchain to compiler this version
busybox, I could run the execution file busybox.

   Please let me know how to fix this question .


-- 
Oyster Liu(?B?t??)
0911-679670
E-mail: oysterliu at gmail.com
           oysterliu at yahoo.com.tw
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070116/6df5c177/attachment.htm 
