From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 10 Sep 2015 12:33:51 +0200
Subject: [Buildroot] [RFC] Add pyudev package
Message-ID: <1441881232-8107-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides Python bindings for udev. The package can be successfully
installed, but it fails to find libudev via find_library(). See [1] for details.
I have even tried to install binutils, but it fails anyway.

This issue is quite old [2], but so far there is no official solution.

Should we include this package anyway? It is at least a good test field to check
for future find_library() solutions/fixes.

[1] https://github.com/pyudev/pyudev/issues/83
[2] https://bugs.python.org/issue13508
