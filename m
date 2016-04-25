From: rfinkelstein at rtsys.fr <rfinkelstein@rtsys.fr>
Date: Mon, 25 Apr 2016 14:31:12 +0200
Subject: [Buildroot] QMAKESPEC has not been set
Message-ID: <cbbb11e2c7e662c45ad8c288e9f113d8@rtsys.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, I am using Buildroot 2016.02.

I'm trying to build the package python-pyqt5, to do so the package 
python-sip 4.16.7 is selected,

When building the python-sip I get the error:
"QMAKESPEC has not been set, so configuration cannot be deduced."

If I create a environment variable QMAKESPEC,and export it, when I run 
only the command that generated the error in the terminal, it works, and 
go through without showing this error, but when I try to do the full 
build the error keeps showing.

Any ideia why? and maybe how to fix?
