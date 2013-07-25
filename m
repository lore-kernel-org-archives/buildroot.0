From: Woody Wu <narkewoody@gmail.com>
Date: Thu, 25 Jul 2013 10:42:03 +0800
Subject: [Buildroot] Strange error when set root password in buildroot
Message-ID: <20130725024203.GC391@zuhnb712.ap.bm.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 

Today I just set the root password in buildroot. Then I got strange
error when building:

/usr/bin/sed -i -e 's,^root:[^:]*:,root:usage: mkpasswd [args] [user]   where arguments are:     -l #      (length of password, default = 9)     -d #      (min # of digits, default = 2)     -c #      (min # of lowercase chars, default = 2)     -C #      (min # of uppercase chars, default = 2)     -s #      (min # of special chars, default = 1)     -v        (verbose, show passwd interaction)     -p prog   (program to set password, default = passwd):,' /home/woody/src/buildroot-2013.05/output/target/etc/shadow
/usr/bin/sed: -e expression #1, char 109: unknown option to `s'
make: *** [target-root-passwd] Error 1

What's the problem? Thanks.

-- 
I can't go back to yesterday - because I was a different person then
