From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:29:10 +0200
Subject: [Buildroot] [PATCH v3 1/2] pps-tools: new package
In-Reply-To: <1413480654-59217-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1413480654-59217-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20141019172910.6dc8cba9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Thu, 16 Oct 2014 12:30:53 -0500, Matt Weber wrote:
> From: Bryan Brinsko <bryan.brinsko@rockwellcollins.com>
> 
> Added pps-tools package to add support to the ntpd for a
> pps source (requires timepps.h from pps-tools as part of ntpd
> build).
> 
> Signed-off-by: Bryan Brinsko <bryan.brinsko@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

Both patches applied. On this first patch, I've fixed the alphabetic
ordering as noticed by Jerzy, and I've added $(TARGET_MAKE_ENV) to the
$(MAKE) invocations in the install commands.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
