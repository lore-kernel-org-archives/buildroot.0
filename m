From: Rob Schottland (buildroot) <arm@ras.kells.com>
Date: Sat, 27 Apr 2013 13:43:39 -0700
Subject: [Buildroot] xconfig "Save As" behavior
Message-ID: <517C387B.80205@ras.kells.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In buildroot-2013.02 "make xconfig", I have found that the "Save As" 
option from the File menu ignores the filename and directory entered and 
saves instead to the original .config file, reporting
#
# configuration written to  {buildroot install directory}/.config
#

Has this been reported previously?

in "make menuconfig" the "save as" feature works as it should.

Rob

  -- Rob Schottland
