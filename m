From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Tue, 28 Jul 2015 17:07:06 -0700
Subject: [Buildroot] make uclibc-configured
Message-ID: <944894A3EB1D044A9003B2F944389BB20474AD8E34@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot mailing list,

My "make uclibc-configured" command failed as shown below:

tclee at HP-Compaq-dc7900-Convertible-Minitower:~/Downloads/jul27mon15/buildroot$ make uclibc-configured
.....
/home/tclee/Downloads/jul27mon15/buildroot/output/toolchain/gcc-4.6.3/gcc/doc/service.texi:6: warning: node prev `Service' in menu `Trouble' and in sectioning `Bugs' differ
/home/tclee/Downloads/jul27mon15/buildroot/output/toolchain/gcc-4.6.3/gcc/doc/service.texi:6: warning: node up `Service' in menu `Bugs' and in sectioning `Top' differ
make[2]: *** [doc/gcc.info] Error 1
rm gcc.pod
make[2]: Leaving directory `/home/tclee/Downloads/jul27mon15/buildroot/output/toolchain/gcc-4.6.3-initial/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory `/home/tclee/Downloads/jul27mon15/buildroot/output/toolchain/gcc-4.6.3-initial'
make: *** [/home/tclee/Downloads/jul27mon15/buildroot/output/toolchain/gcc-4.6.3-initial/.compiled] Error 2

My host is Ubuntu-14.04LTS; my HOSTCC equals /usr/bin/gcc (Ubuntu 4.8.4-2ubuntu1~14.04). You probably know how to resolve the issues. I will provide you with the information of my Buildroot configuration.

Tommy



________________________________
This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150728/9ca07a9e/attachment.html>
