From: Lee JJ <jengjr@gmail.com>
Date: Fri, 29 Jun 2007 15:20:35 +0800
Subject: [Buildroot] x86_64 , cannot find /lib/libc.so.0
Message-ID: <1497cb6d0706290020n269e359av8682c69fb22b3e79@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/root/buildroot/build_x86_64/staging_dir/usr/x86_64-linux-uclibc/bin/ld:
skipping incompatible /root/buildroot/build_x86_64/s
taging_dir/lib/libc.so.0 when searching for /lib/libc.so.0
/root/buildroot/build_x86_64/staging_dir/usr/x86_64-linux-uclibc/bin/ld: cannot
find /lib/libc.so.0 inside /root/buildroot/bu
ild_x86_64/staging_dir
collect2: ld returned 1 exit status
make[4]: *** [32/libgcc_s.so] Error 1

# ls build_x86_64/staging_dir/lib/libc.so.0 -lt
lrwxrwxrwx 1 root root 19 Jun 28 15:11
build_x86_64/staging_dir/lib/libc.so.0 -> libuClibc-0.9.29.so

But the file do exist !??
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070629/431fd99b/attachment.htm 
