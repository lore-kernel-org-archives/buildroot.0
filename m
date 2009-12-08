From: Nicolae T <microvis@cox.net>
Date: Mon, 07 Dec 2009 19:33:39 -0800
Subject: [Buildroot] linux-fusion build failure
Message-ID: <1260243219.5232.1.camel@RoadRunner>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Can anyone explain what's going on here with linux-fusion build failing
here?
Thanks


cat: /home/nicolae/buildroot7Dec/output/build/.linux-version: No such
file or directory
cat: /home/nicolae/buildroot7Dec/output/build/.linux-version: No such
file or directory
cat: /home/nicolae/buildroot7Dec/output/build/.linux-version: No such
file or directory
cat: /home/nicolae/buildroot7Dec/output/build/.linux-version: No such
file or directory
expr: syntax error
make[1]: Entering directory
`/home/nicolae/buildroot7Dec/output/build/linux-fusion-8.0.2'
rm -f linux/drivers/char/fusion/Makefile
ln -s Makefile-2. linux/drivers/char/fusion/Makefile
/usr/bin/make -C /home/nicolae/buildroot7Dec/output/build/linux- \
ARCH=arm \
CC=/home/nicolae/buildroot7Dec/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc \
AS=/home/nicolae/buildroot7Dec/output/staging/usr/bin/arm-linux-uclibcgnueabi-as \
CPPFLAGS=" \
-I`pwd`/linux/include \
-I/home/nicolae/buildroot7Dec/output/build/linux-/include \
-I/home/nicolae/buildroot7Dec/output/build/linux-/include \
-I/home/nicolae/buildroot7Dec/output/build/linux-/arch/arm/include \
" \
SUBDIRS=`pwd`/linux/drivers/char/fusion modules
make: Entering an unknown directory
make: *** /home/nicolae/buildroot7Dec/output/build/linux-: No such file
or directory.  Stop.
make: Leaving an unknown directory
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/nicolae/buildroot7Dec/output/build/linux-fusion-8.0.2'
make: ***
[/home/nicolae/buildroot7Dec/output/build/linux-fusion-8.0.2/.install]
Error 2
nicolae at RoadRunner:~/buildroot7Dec$ 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091207/8c46ac1c/attachment.htm>
