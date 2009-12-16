From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 16:41:36 +0100
Subject: [Buildroot] [git commit master] dependencies: bail out if makeinfo
	isn't found
Message-ID: <20091216154216.0B855777B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8dba09de9d62422167164df0038d7d7cf062a252
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

makeinfo is mandatory at least to build a toolchain. Currently,
dependencies.sh doesn't fail if makeinfo is not present and only
displays a message that can easily be lost. The user will then
encounter the issue later, when it is more difficult to understand
what's happening.

So, this patch simply does for makeinfo what the script does for the
other dependencies: bail out if they aren't available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Patch is too large, so refusing to show it
