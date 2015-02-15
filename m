From: Jordi Llonch <jordi.llonch@rochsystems.com>
Date: Mon, 16 Feb 2015 10:12:09 +1100
Subject: [Buildroot] python: host-python ssl support
Message-ID: <etPan.54e127c9.6b8b4567.29a8@MacBook-Pro-de-Jordi.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

SSL support is explicitly disabled for host-python and needed by the latest pip to install from https. As per today, all the downloads from Python Package Index are https.

I saw in the list a patch from Rohan Fletcher implementing?BR2_HOST_PYTHON_SSL_SUPPORT and looks it was never merged.

Following the instructions in section 17.8 from Buildroot manual does not work for me. Am I doing something wrong? What is the correct strategy for building a python application with external dependencies?

Thanks in advance,
Jordi
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150216/8a4a258b/attachment.html>
