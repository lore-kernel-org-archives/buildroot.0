From: Christian Stewart <christian@paral.in>
Date: Mon, 27 Jun 2016 22:22:22 +0000
Subject: [Buildroot] [PATCH v6 0/3] Add docker engine support
In-Reply-To: <1464475578-22239-1-git-send-email-christian@paral.in>
References: <1464475578-22239-1-git-send-email-christian@paral.in>
Message-ID: <1467066142813-e25400a6-3dadea3a-0c9ab227@mixmax.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,
On Sat, May 28, 2016 at 3:46 PM Christian Stewart <christian@paral.in> wrote:
> This series adds runc, docker-containerd, and docker-engine support.
Quick update regarding dependencies. As of Docker v1.12-rc2 all dependency code
is vendored into the Git tree itself. This means that the repo tarball actually
contains all of the build-time Go dependencies in it, and no extra Git fetches
are required. This should fix the problem with pulling additional code snapshots
at build time.
~ Christian Stewart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160627/3428f419/attachment.html>
