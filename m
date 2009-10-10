From: Sushil Kumar <sushil_tux@yahoo.com>
Date: Sat, 10 Oct 2009 11:30:21 -0700 (PDT)
Subject: [Buildroot] How to use gcc-4.1.1 with buildroot
Message-ID: <370185.76895.qm@web58207.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
My "specific" requirement is to generate statically linked busybox binary using uClibc C library.
I am using busybox-1.14.3 and uClibc-0.9.30.1.? Initially, I tried to compile busybox with uClibc but I contiue to get linking error.? I was advised from busybox "gurus" to use buildroot for this purpose.
?
I downloaded buildroot?but while configuring I could not find gcc-4.1.1 compiler option in the toolchain.? 
Question: Please suggest me?how to compile buildroot using gcc-4.1.1 compiler.? Is it possible?
?
I could see on "successfully building" the buildroot that the busybox binary is created in 
project_build_i386/uclibc/busybox-1.14.3.? But this binary is created using gcc-4.3. So if I could use gcc-4.1.1, my purpose may be solved.
?
Thanks for your help.
?
Sushil
?
?
?


      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091010/55a9077a/attachment.htm>
