From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Jul 2020 09:13:25 +0200
Subject: [Buildroot] [git commit] support/testing: drop explicit docker
 kernel options from docker test
Message-ID: <20200731071037.49376813A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=436daadc42f4b92c2103b273df86bd2c7161e644
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 0390777bfaff6c6 (package/docker-engine: needs some kernel
options), docker-engine now automatically ensures the needed kernel options
are enabled, so drop the explicit options from the kernel config.

23:19:27 TestDockerCompose                        Starting
23:19:28 TestDockerCompose                        Building
00:14:41 TestDockerCompose                        Building done
00:15:30 TestDockerCompose                        Cleaning up
