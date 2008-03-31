From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Mon, 31 Mar 2008 14:49:36 +0200
Subject: [Buildroot] make ARCH=ppc ml405_defconfig
Message-ID: <091201c893c8$109f0b60$f52f9e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,
I would like to build a kernel with the exact way specified in the subject 
of this message. But if I try it from buildroot's directory, I get:

$ make ARCH=ppc ml405_defconfig
cp  .config
cp: missing destination file operand after `.config'
Try `cp --help' for more information.
make: *** [ml405_defconfig] Error 1

So I assume the target is not known at the buildroot level. Anything I can 
do about that ?
-- 
Guillaume Dargaud
http://www.gdargaud.net/
  "Welcome to the employee rock-climbing seminar. You'll learn valuable 
teamwork skills by doing dangerous things unrelated to your jobs."    - 
Dilbert (1997/8/3). 
