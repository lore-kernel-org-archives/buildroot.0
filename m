From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Mon, 9 May 2016 22:16:46 +0200
Subject: [Buildroot] About python2 and python3
Message-ID: <5730F02E.6040806@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
if python2 is selected is not possible to add python3.
But python2 and python3 are quite different and sometimes is useful to 
have both. i cannot deselect python2 because is selected by another package.

I tried to force the compilation of python3 (removing the dependency 
from python2) but the dbus module is not found.
Instead python2 finds the dbus module, but complains about the missing 
of xml.parsers.expat module.

I checked and BR2_PACKAGE_PYTHON*_PYEXPAT are selected.

Just for info I need this to run the ofono tests.
