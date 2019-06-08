From: Yi Zheng <goodmenzy@gmail.com>
Date: Sat, 8 Jun 2019 11:24:25 +0800
Subject: [Buildroot] [buildroot] patch for suricata, wrong shebang in python/
Message-ID: <CAJPHfYNQFLkgCJ2dmwt87r2ByF=3HH_P+4bxU8FSPb_iP5TfzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
  I found that  /usr/bin/suricatactl and /usr/bin/suricatasc  has wrong
shebang, which using the path of python in the HOST machine.

The patch is attached.

Could you please have a look?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190608/4f5e1e79/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0015-suricata-fixup-wrong-shebang.patch
Type: text/x-patch
Size: 1362 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190608/4f5e1e79/attachment.bin>
