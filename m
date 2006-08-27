From: Jay Kumar Jaradi <JayKumar.Jaradi@conexant.com>
Date: Sun, 27 Aug 2006 20:12:19 +0530
Subject: [Buildroot] tool chain for generic ARM and gcc 4.0.1 with soft float
Message-ID: <337B93ADB03542478E926909811991BB2CD714@noida-mail.bbnet.ad>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

 

I am using modified patch (arm softfloat ...)(attached) for generating
tool chain for following configuration:

 

gcc -                             4.0.1

binutils -                        2.16.1

linux headers -               2.6.11

uClibc snapshot -           08-14-2006

.config -                         attached

Floating point -               soft floating point support internal to
multilib, no hard floats, no vfp, ...

 

After applying this patch, 'genuine' errors in bootstrapping gcc have
been lost, BUT I am expecting them to arrive at my application.

 

Q. How can I validate my configuration for soft float?

Q. How can I validate my changes in gcc source (GNU, FSF,) really I
don't know much about this.

 

Thanks & Regards,

JK

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20060827/c7dff215/attachment.html 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: gcc-4.0.1_uClibc_softfloat_shared-lib-Buildroot.patch
Type: application/octet-stream
Size: 6699 bytes
Desc: gcc-4.0.1_uClibc_softfloat_shared-lib-Buildroot.patch
Url : http://busybox.net/lists/buildroot/attachments/20060827/c7dff215/attachment.obj 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 8987 bytes
Desc: config
Url : http://busybox.net/lists/buildroot/attachments/20060827/c7dff215/attachment-0001.obj 
