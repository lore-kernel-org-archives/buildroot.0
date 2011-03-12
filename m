From: bao bui <buiqbao@gmail.com>
Date: Fri, 11 Mar 2011 23:53:48 -0800
Subject: [Buildroot] compile espgs 8.15.4 with buildroot
Message-ID: <AANLkTin96tM_skmaWcEBDDfBB6Aoi+6s7ZrecspigB9x@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to add esp ghost script 8.15.4 to buildroot.
I got the error:
>>> espgs 8.15.4 Patching package/espgs
for file in config.guess config.sub; do for i in $(find
/home/bao/work/buildroot/output/build/espgs-8.15.4 -name $file); do cp
package/gnuconfig/$file $i; done; done
cp: not writing through dangling symlink
`/home/bao/work/buildroot/output/build/espgs-8.15.4/ijs/config.guess'
cp: not writing through dangling symlink
`/home/bao/work/buildroot/output/build/espgs-8.15.4/ijs/config.sub'
make: ***
[/home/bao/work/buildroot/output/build/espgs-8.15.4/.stamp_patched] Error 1


How to fix it?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110311/4853b5c1/attachment.html>
