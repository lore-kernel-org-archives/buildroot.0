From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Feb 2016 22:32:16 +0100
Subject: [Buildroot] [PATCH v3] msr-tools: new package
In-Reply-To: <1456693978-12086-1-git-send-email-vincent.stehle@intel.com>
References: <56CBA62E.1040200@mind.be>
 <1456693978-12086-1-git-send-email-vincent.stehle@intel.com>
Message-ID: <20160228223216.7338e9b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent Stehl?,

On Sun, 28 Feb 2016 22:12:58 +0100, Vincent Stehl? wrote:
> The MSR Tools project provides utilities to access x86 processor MSRs
> and CPU ID directly.
> 
> https://01.org/msr-tools
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@intel.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---

Applied to next with the following changes:

    [Thomas:
     - rewrap Config.in help text
     - use $(TARGET_MAKE_ENV) when calling $(MAKE).]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
