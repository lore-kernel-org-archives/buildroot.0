From: Jinag Robert <cretaceousstone@yahoo.com.cn>
Date: Thu, 16 Aug 2007 11:55:06 +0800 (CST)
Subject: [Buildroot] How to cross compile openssh for arm
Message-ID: <452620.55884.qm@web15811.mail.cnb.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello  All,

I'm trying  to  build  openssh  for  arm  platform, but failed. 

[root at armqa buildroot]#make openssh

......
      ./configure \
        --target=arm-linux \
        --host=arm-linux \
        --build=i386-pc-linux-gnu \
        --prefix=/usr \
        --exec-prefix=/usr \
        --bindir=/usr/bin \
        --sbindir=/usr/sbin \
        --libdir=/lib \
        --libexecdir=/usr/sbin \
        --sysconfdir=/etc \
        --datadir=/usr/share \
        --localstatedir=/var \
        --mandir=/usr/man \
        --infodir=/usr/info \
        --includedir=/opt/926t/buildroot/build_arm/staging_dir/usr/include \
        --disable-lastlog --disable-utmp \
        --disable-utmpx --disable-wtmp --disable-wtmpx \
        --without-x \
        --disable-nls \
         \
);
checking for arm-linux-gcc... /usr/local/arm/4.1.1-920t/bin/arm-linux-gcc -Os -pipe  -I/opt/926t/buildroot/build_arm/staging_dir/include -I/opt/926t/buildroot/build_arm/staging_dir/usr/include -I/usr/local/arm/4.1.1-920t/arm-linux/include
checking for C compiler default output file name... configure: error: C compiler cannot create executables
See `config.log' for more details.
make: *** [/opt/926t/buildroot/build_arm/openssh-3.9p1/.configured] Error 77

Any help?

Thanks,
Robert



       
____________________________________________________________________________________
Choose the right car based on your needs.  Check out Yahoo! Autos new Car Finder tool.
http://autos.yahoo.com/carfinder/
