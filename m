From: Julien COUVRAND <julien.couvrand@stericsson.com>
Date: Wed, 17 Jul 2013 15:03:10 +0200
Subject: [Buildroot]  Activation of pygobject
Message-ID: <747C1E83C744F44E9ACFB89FAEEC2C7B2423DFD2A7@EXDCVYMBSTM005.EQ1STM.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Trying to enable simple agent from bluez such as?:
simple-agent hci0 68:EB:AE:4F:A4:B5

I meet an error:
---
Traceback (most recent call last):
  File "/usr/bin/simple-agent", line 3, in <module>
    import gobject
ImportError: No module named gobject
---

My configuration is the following:
- Bluez
- Python
- Dbus-glib
- Dbus-python

However, on buildroot, I don't find the way to import python-gobject.
Do you know how to import gobject?


Thanks in advance


Julien
