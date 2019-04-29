From: Serhii Sakhno <sergei.sakhno@gmail.com>
Date: Mon, 29 Apr 2019 14:18:15 +0300
Subject: [Buildroot] Add python module Connexion
Message-ID: <CAOqJNTe=E=jd_4MEoWAMAAgQJh9vSLMB0gBzHbcdM9vTbRoQVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I would to add python module Connexion to buildroot. I haven`t problems
with other python modules, but with Connexion (and with logging_tree, if i
right remember) i have same problem.

 >>> python-connexion 2.2.0 Building
buildroot_1  | (cd
/ntc_image/standard/output/build/python-connexion-2.2.0//;
_PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata_m_linux_arm-linux-gnueabihf"
PATH="/ntc_image/standard/output/host/bin:/ntc_image/standard/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
PYTHONPATH="/ntc_image/standard/output/target/usr/lib/python3.7/"
PYTHONNOUSERSITE=1
_python_sysroot=/ntc_image/standard/output/host/arm-buildroot-linux-gnueabihf/sysroot
_python_prefix=/usr _python_exec_prefix=/usr
/ntc_image/standard/output/host/bin/python setup.py build  )
buildroot_1  | Download error on https://pypi.org/simple/flake8/: unknown
url type: https -- Some packages may not be found!
buildroot_1  | Couldn't find index page for 'flake8' (maybe misspelled?)
buildroot_1  | Download error on https://pypi.org/simple/: unknown url
type: https -- Some packages may not be found!

And now i didn't found problem with ssl.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190429/13e12a6a/attachment.html>
