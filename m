From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 10:39:10 +0200
Subject: [Buildroot] [PATCH v1 3/9] board/intel/common: Add possibility
 for adding ACPI tables to the initrd
In-Reply-To: <7d61148d-f102-bc79-e177-3ec8f6f95b8e@mind.be>
References: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1472133887-34746-4-git-send-email-andriy.shevchenko@linux.intel.com>
 <7d61148d-f102-bc79-e177-3ec8f6f95b8e@mind.be>
Message-ID: <20160826103910.0765e210@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Aug 2016 08:13:54 +0200, Arnout Vandecappelle wrote:

>  Note: I don't agree with Thomas that there should be buildroot config for doing
> this. It's simple enough to do in a post-build script, which is more flexible.

Depends on what gets done. And just like our linux.mk package allows to
build DTBs, it could allow building ACPI table, which is something
several x86 platforms might need.

What I *really* dislike in the proposal is the additional magic
environment variables, and there's specifically one to list the ACPI
tables to build.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
