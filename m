From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 07:31:50 +0200
Subject: [Buildroot] [PATCH 1/1] python-daemon: bump to version 2.1.1
In-Reply-To: <1474165881-2553-1-git-send-email-danomimanchego123@gmail.com>
References: <1474165881-2553-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20160921073150.56ae4397@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Sep 2016 22:31:21 -0400, Danomi Manchego wrote:
> Bump to the latest version, to get python3 support.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

This update is causing lots of autobuilder failures, see
http://autobuild.buildroot.net/?reason=python-daemon-2.1.1. Yegor had a
look and proposed a few ideas.

Danomi, do you think you can have a look in the near future? If not,
I'll revert the version bump, until a patch series that addresses the
build issue is proposed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
