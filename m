From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 14:12:59 +0200
Subject: [Buildroot] [PATCH v2] ARC: allow selection of MMU page size
In-Reply-To: <1437124302-18610-1-git-send-email-abrodkin@synopsys.com>
References: <1437124302-18610-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150718141259.1c7bd109@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Fri, 17 Jul 2015 12:11:42 +0300, Alexey Brodkin wrote:
> Modern ARC cores (those sporting MMU of version 3 and 4) allow selection
> of different page sizes (4, 8 or 16 kB) during ASIC design creation.
> And it's important to build a toolchain with page size setting that matches
> hardware.
> 
> Otherwise user-space applications will fail on execution due to
> unexpected data layout/alignment etc.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Anton Kolesov <akolesov@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---

I've done some minor edits of the Config.in help text, and also fixed
the indentation: indentation for Config.in properties is one tab, and
for the help text it's one tab + two spaces (it was broken in several
places). After fixing those minor issues, I've applied and pushed!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
