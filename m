From: sudheer.bangera <bsudheer143@indiatimes.com>
Date: Thu, 14 May 2009 09:45:53 -0700 (PDT)
Subject: [Buildroot]  Errror during make command
Message-ID: <23544482.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,
I want to port embedded linux in ARM board.
I have started with buildroot download.
steps finished:
1.downloaded buildroot-snapshot.tar.bz2 and untar done.
2. cd /buildroot folder
then
3.make menuconfig command
4. Then make command , It takes more time and finally it gives the error
like this

*** Unpacking kernel source
bzcat /root/sudheer/buildroot/dl/linux-2.6.29.3.tar.bz2 | tar -C
/root/sudheer/buildroot/project_build_arm/uclibc -xf -
touch
/root/sudheer/buildroot/project_build_arm/uclibc/linux-2.6.29.3/.unpacked
toolchain/patch-kernel.sh
/root/sudheer/buildroot/project_build_arm/uclibc/linux-2.6.29.3
toolchain/kernel-headers \
linux-2.6.29.3-\*.patch{,.gz,.bz2}
touch
/root/sudheer/buildroot/project_build_arm/uclibc/linux-2.6.29.3/.patched
cp -dpf
/root/sudheer/buildroot/project_build_arm/uclibc/linux-2.6.29.3/.config
cp: missing destination file operand after
`/root/sudheer/buildroot/project_build_arm/uclibc/linux-2.6.29.3/.config'
Try `cp --help' for more information.
make: ***
[/root/sudheer/buildroot/project_build_arm/uclibc/linux-2.6.29.3/.configured]
Error 1


please help me to solve this problem.
i am using following software and hardware config:

1.Ubuntu 8.04 linux
2. Intel based motherboard
-- 
View this message in context: http://www.nabble.com/Errror-during-make-command-tp23544482p23544482.html
Sent from the BuildRoot mailing list archive at Nabble.com.
