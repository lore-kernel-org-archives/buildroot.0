From: scdrj <scdrjcom@gmail.com>
Date: Tue, 12 Jan 2021 23:41:50 -0600 (CST)
Subject: [Buildroot] Per package src+build directory
Message-ID: <1610516510799-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

How do I set a custom src/build directory for a particular package?

I have tried OVERRIDE_SRCDIR, but it always performs rsync to the build
folder (makes an extra copy).

I want to perform the in-place build. 

Currently, I am doing it by creating a symbolic link in the build folder
from the original src directory and by manually creating various
downloaded/patched/extracted ".stamp_XXXXXX" files.



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
