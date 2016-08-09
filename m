From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 15:46:42 +0200
Subject: [Buildroot] [PATCH] docs/manual: fix patch naming convention
In-Reply-To: <1470749584-17489-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1470749584-17489-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160809154642.5254d717@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Aug 2016 15:33:04 +0200, Gary Bisson wrote:
> Otherwise conflicts with the naming convention from previous section.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> Hi all,
> 
> While creating a patch for the gst1-imx package I wasn't sure what
> was the latest naming convention. Looking at the documentation, it
> said in section 18.1.2. that it should be:
> <number>-<description>.patch
> whereas section 18.2. still recommends:
> <packagename>-<number>-<description>.patch
> 
> Looking at the patches it is clear section 18.2 was outdated.

Indeed.

> Also, should we insist on the fact that the series file is deprecated
> in section 18.2.?

No, I think that 18.2 explains how we are applying the patches, not
what is the recommended best practice. Since we still support reading a
series file, I would keep that information.

Other than that: patch applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
