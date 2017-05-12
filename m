From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 May 2017 21:15:35 +0200
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2017.03-rc2
In-Reply-To: <20170512183104.37886-1-abrodkin@synopsys.com>
References: <20170512183104.37886-1-abrodkin@synopsys.com>
Message-ID: <20170512211535.555af2a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 May 2017 21:31:04 +0300, Alexey Brodkin wrote:
> This commit bumps ARC toolchain to arc-2017.03-rc2
> 
> Please note that it is a release candidate and it might contain some
> breakages, please don't use it for production builds.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

What should we do in Buildroot master branch? We're currently using
arc-2017.03-rc1, which is also a release candidate. We are planning on
releasing Buildroot at the end of the month.

Should we pick -rc2 instead of -rc1 for this release ? We normally
don't upgrade components after Buildroot has released its -rc1, but I
guess we could make an exception since a release candidate is used for
ARC toolchain components.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
