From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 15:46:04 +0100
Subject: [Buildroot] [RFC PATCH 8/9] support/scripts: check-host-rpath
 now handles $ORIGIN as well
In-Reply-To: <1488550733-3956-9-git-send-email-wg@grandegger.com>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
 <1488550733-3956-9-git-send-email-wg@grandegger.com>
Message-ID: <20170303154604.53543d88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Mar 2017 15:18:52 +0100, Wolfgang Grandegger wrote:
> $ORIGIN/../../usr/bin is also a valid rpath for binaries in
> "$hostdir/usr/bin".

I guess you meant $ORIGIN/../../usr/lib and $hostdir/usr/lib here,
right?

Isn't this patch 8/9 actually a fix, which should come first in the
series, and that we could/should apply quickly, independent from the
rest?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
