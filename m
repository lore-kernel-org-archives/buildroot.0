From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 17:54:58 +0200
Subject: [Buildroot] [PATCH V3,
 1/1] Fix: qt5webkit overwrites target python.
In-Reply-To: <1476887724-30979-1-git-send-email-johanderycke@gmail.com>
References: <1476887724-30979-1-git-send-email-johanderycke@gmail.com>
Message-ID: <20161019175458.127b4fcf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The commit title should always have the format:

	<package>: <what you're doing>

On Wed, 19 Oct 2016 16:35:24 +0200, johanderycke at gmail.com wrote:
> From: Johan Derycke <johan.derycke@barco.com>
> 
> Fixes issue with https://git.buildroot.net/buildroot/commit/?id=ac16793eaaabfced0312420759e3a66cdaa1ea8e.
> We made a link in $(@D)/bin/python which is copied to $(TARGET_DIR) during install and overwrites target pyton.
> Fixed by using $(@D)/host-bin instead.
> 
> Signed-off-by: Johan Derycke <johan.derycke@barco.com>
> Tested-by: Yegor Yefremov <yegorslists@googlemail.com>

I've fixed the commit title, reworked the commit log, and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
