From: Hmidi Slim <hmidi.slim1@gmail.com>
Date: Sun, 16 Aug 2015 13:28:07 +0200
Subject: [Buildroot] How to fix buildroot Errors?
Message-ID: <CA+yqE7_X-mMYS7t_xhZCYdsqeThf3zFh0X1pFWYKTYh4otoQjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After make configurations on buildroot,I run Make the I got these message
errors:
File
"/home/slim/T?l?chargements/buildroot-2015.05/output/host/usr/lib/python2.7/json/__init__.py",
line 338, in loads
    return _default_decoder.decode(s)
  File
"/home/slim/T?l?chargements/buildroot-2015.05/output/host/usr/lib/python2.7/json/decoder.py",
line 366, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
  File
"/home/slim/T?l?chargements/buildroot-2015.05/output/host/usr/lib/python2.7/json/decoder.py",
line 382, in raw_decode
    obj, end = self.scan_once(s, idx)
ValueError: Invalid \escape: line 10 column 46 (char 416)
make[1]: *** [install] Error 1
make[1]: Leaving directory
`/home/slim/T?l?chargements/buildroot-2015.05/output/build/host-nodejs-0.10.38'
make: ***
[/home/slim/T?l?chargements/buildroot-2015.05/output/build/host-nodejs-0.10.38/.stamp_host_installed]
Error 2

My .config:http://code.bulix.org/kxny84-88785.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150816/1c4f50fd/attachment.html>
