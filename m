From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 17:07:13 +0100
Subject: [Buildroot] [PATCH] vlc: enable package on ARC
In-Reply-To: <20171011125005.25545-1-didin@synopsys.com>
References: <20171011125005.25545-1-didin@synopsys.com>
Message-ID: <20180101170713.54183634@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Oct 2017 15:50:05 +0300, Evgeniy Didin wrote:
> Now using arc-2017.09-rc1 toolchain it is possible to
> build vlc package.
> 
> Note this patch has a prerequisite that updates ARC prebuilt toolchain,
> http://patchwork.ozlabs.org/patch/824311/

I've applied this patch. However, we still haven't received a new
version of the patch bumping the ARC external toolchain. Could you send
such an update in the near future ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
