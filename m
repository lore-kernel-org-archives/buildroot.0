From: Lijun QIN <lijun.qin2008@gmail.com>
Date: Wed, 1 Oct 2014 07:21:37 -0500
Subject: [Buildroot] buildroot-2011.05-sdk5.1.2 python2.7.1
Message-ID: <CALD51P_2sBRveQaY6xM6ZP8RLt6Q51hNdXSH7zyWjtPaWHHopw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

Buildroot-2011.05:
(a) gcc4.8 cross compiler for arm processor
(b) compile  python2.7.1  using the default options/patach in
 package/python.
got error message:

Python build finished, but the necessary bits to build these modules were
not found:

_bsddb             _sqlite3           _tkinter

bsddb185           dbm                gdbm

linuxaudiodev      ossaudiodev        sunaudiodev

To find the necessary bits, look in setup.py in detect_modules() for the
module's name.


Any body could kindly offer any advice ?


Thank You -


Lijun Qin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141001/f7a4b064/attachment.html>
