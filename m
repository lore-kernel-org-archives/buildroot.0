From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 22:04:42 +0100
Subject: [Buildroot] [git commit] package/systemd: bump version to 241
Message-ID: <20190314210224.8C86781522@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbe8d0b24a4f4023a09d90442eaa12ef85b49e64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In addition:
  - Remove patches that have been committed upstream.
  - Update hash for the README file. (Meson and Dbus dependency version updates)

./support/testing/run-tests -d dl -o output -k tests.init.test_systemd
14:18:20 TestInitSystemSystemdRwNetworkd          Starting
14:18:21 TestInitSystemSystemdRwNetworkd          Building
14:26:20 TestInitSystemSystemdRwNetworkd          Building done
14:27:01 TestInitSystemSystemdRwNetworkd          Cleaning up
.14:27:01 TestInitSystemSystemdRwIfupdown         Starting
14:27:01 TestInitSystemSystemdRwIfupdown          Building
14:28:35 TestInitSystemSystemdRwIfupdown          Building done
14:29:03 TestInitSystemSystemdRwIfupdown          Cleaning up
.14:29:03 TestInitSystemSystemdRwFull             Starting
14:29:04 TestInitSystemSystemdRwFull              Building
14:44:35 TestInitSystemSystemdRwFull              Building done
14:45:18 TestInitSystemSystemdRwFull              Cleaning up
.14:45:18 TestInitSystemSystemdRoNetworkd         Starting
14:45:19 TestInitSystemSystemdRoNetworkd          Building
14:55:59 TestInitSystemSystemdRoNetworkd          Building done
14:56:23 TestInitSystemSystemdRoNetworkd          Cleaning up
.14:56:23 TestInitSystemSystemdRoIfupdown         Starting
14:56:24 TestInitSystemSystemdRoIfupdown          Building
15:06:42 TestInitSystemSystemdRoIfupdown          Building done
15:07:09 TestInitSystemSystemdRoIfupdown          Cleaning up
.15:07:09 TestInitSystemSystemdRoFull             Starting
15:07:10 TestInitSystemSystemdRoFull              Building
15:21:17 TestInitSystemSystemdRoFull              Building done
15:21:46 TestInitSystemSystemdRoFull              Cleaning up
