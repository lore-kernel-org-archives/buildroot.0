From: Nataraj S Narayan <natarajsn@gmail.com>
Date: Fri, 30 Jul 2010 12:27:23 +0530
Subject: [Buildroot] BR on FreeBSD
Message-ID: <AANLkTikMQtr83OBZ=-f1DvH-XnTLfdstQeQtwN-E3j1R@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Was trying BR compile on a FreeBSD 8.0 machine. Getting the following:-

[root at freebsd /usr/buildroot]# gmake --debug
GNU Make 3.81
Copyright (C) 2006  Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.

This program built for i386-portbld-freebsd7.1
Reading makefiles...
Updating goal targets....
 File `all' does not exist.
   File `world' does not exist.
     File `dependencies' does not exist.
       File `host-sed' does not exist.
         File `use-sed-host-binary' does not exist.
        Must remake target `use-sed-host-binary'.
        Successfully remade target file `use-sed-host-binary'.
      Must remake target `host-sed'.
      Successfully remade target file `host-sed'.
    Must remake target `dependencies'.
[: make:: bad number
[: make:: bad number
-e \nYou must install 'bash' on your build machine\n
gmake: *** [dependencies] Error 1
[root at freebsd /usr/buildroot]# bash
[root at freebsd /usr/buildroot]# gmake
[: make:: bad number
[: make:: bad number
-e \nYou must install 'bash' on your build machine\n
gmake: *** [dependencies] Error 1

But then I do have bash installed and working.

regards

Nataraj
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100730/c3a47f09/attachment.html>
