From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 09:13:26 +0100
Subject: [Buildroot] [git commit] package/dropbear: bump version to 2019.77
Message-ID: <20190324081038.8FD7881302@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eece7361c6c8512d57c2b440f664f0e78b4dad00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches as they are now upstream.  Add a hash for the license file.

Verified that runtime test still works:

./support/testing/run-tests -o tests.package.test_dropbear
20:42:44 TestDropbear                             Starting
20:42:45 TestDropbear                             Building
20:44:18 TestDropbear                             Building done
20:44:24 TestDropbear                             Cleaning up
