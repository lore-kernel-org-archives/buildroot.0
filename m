From: Woody Wu <narkewoody@gmail.com>
Date: Thu, 29 Nov 2012 03:31:16 +0000 (UTC)
Subject: [Buildroot] no /etc/hosts error in building root
Message-ID: <slrnkbdlmd.33p.narkewoody@zuhnb712.local.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, List

I just removed the output/target directory and want to root filesystem
to be rebuilt by running 'make' again.  But this time I got an error:

/usr/bin/sed -i -e '$a \127.0.1.1\tbuildroot' \
        -e '/^127.0.1.1/d'
        /home/buildroot/buildroot-2012.08/output/target/etc/hosts
        /usr/bin/sed: can't read
        /home/buildroot/buildroot-2012.08/output/target/etc/hosts: No
        such file or directory


Do you know what's the cause and how to fix it?

BTW:  If I also want the root iamges under output/images directory to be
regenerated, is that enough to only remobe the output/target and run
'make'?  I tried something like 'make root-rebuild' and 'make
rootfs-rebuild' but they do not work.


Thanks in advance.


-- 
woody
I can't go back to yesterday - because I was a different person then.
