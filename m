From: Mike Williams <mike@mikebwilliams.com>
Date: Tue, 30 Sep 2014 16:11:33 -0400
Subject: [Buildroot] Fix valgrind support for Cortex A5 systems
Message-ID: <1412107895-10015-1-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds configuration support in buildroot to allow valgrind on A5 systems,
and also patches valgrind to correctly detect the host toolchain from buildroot
as compatible. 
