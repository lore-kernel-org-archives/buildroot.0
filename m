From: Self User <selfuser@gmail.com>
Date: Thu, 28 Dec 2017 11:42:34 +0200
Subject: [Buildroot] Adding path in the Config.in file
Message-ID: <CALZKj1P09_=7w4+gqDUQdkD2ykNyyWxxWnCjJpZCw7s+nM6GXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

Is it possible to add the path string itself in the Config.in file?

can I add the path somewhere here?
My adding in RED

for example I have this package that is a proprietary class of mine:

config BR2_PACKAGE_DEVICEMANAGER
depends on BR2_PACKAGE_DBG
bool "DeviceManager"
default y
*        path = /home/test/myboard/package*
help
  DeviceManager is a C++ code for managing card.


Thank

buildroot user
path =
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171228/f06889e6/attachment.html>
