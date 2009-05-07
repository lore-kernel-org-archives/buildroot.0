From: sudheer.bangera <bsudheer143@indiatimes.com>
Date: Thu, 7 May 2009 04:52:25 -0700 (PDT)
Subject: [Buildroot]  Getting problem when make menuconfig
Message-ID: <23407612.post@talk.nabble.com>
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
following is the result for that command.
[root at localhost buildroot]# make menuconfig
make: warning: File 'Makefile' has modification time 2.8e+06s in the future
make CC = " /usr/bin/gcc" -c package / config conf mconf
make[1]: Entering directory ' /home/sudheer/buildroot/package/config'
make[1]: warning : File ' Makefile.kconfig' has modification time 2.8e+06s
in the future
/usr/bin/gcc  -DCURSES_LOC = '<ncurses.h>" -DLOCALE  -g  -02 -MM *.c >
.depend 2>/dec/null || ;
make[1]: Entering directory ' /home/sudheer/buildroot/package/config'
make[1]: warning : File ' Makefile.kconfig' has modification time 2.8e+06s
in the future
/usr/bin/gcc  -DCURSES_LOC = '<ncurses.h>" -DLOCALE  -g  -02 -MM *.c >
.depend 2>/dec/null || ;

It is contineously  repeating untill we stop (Cntr C) 
please help me to solve this problem.
i am using following software and hardware config:

1.Ubuntu 8.04 linux
2. Intel based motherboard
-- 
View this message in context: http://www.nabble.com/Getting-problem-when-make-menuconfig-tp23407612p23407612.html
Sent from the BuildRoot mailing list archive at Nabble.com.
