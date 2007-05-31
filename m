From: Tom <fivemiletom@gmail.com>
Date: Thu, 31 May 2007 09:33:25 -0700
Subject: [Buildroot] BR2_STAGING_DIR config?
Message-ID: <465EF8D5.30902@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I want to use the cross development toolchain also for other projects 
and thus defined:
BR2_STAGING_DIR="/tw/tools/gnu/cygwin/arm-linux"

However, I am getting this error in libutils, what am I missing please?

Configuring in ./libiberty
configure: error: expected an absolute directory name for --prefix: 
tw/tools/gnu/cygwin/arm-linux
make[2]: *** [configure-libiberty] Error 1


Thanks
Tom
