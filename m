From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Aug 2014 16:58:26 +0200
Subject: [Buildroot] [PATCH v2] ARC: bump tools to 2014.08 release
In-Reply-To: <1409064582.6466.21.camel@abrodkin-8560l.internal.synopsys.com>
References: <1408642436-2489-1-git-send-email-abrodkin@synopsys.com>
 <1409064582.6466.21.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <20140826165826.398f7a63@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 26 Aug 2014 14:49:42 +0000, Alexey Brodkin wrote:

> I'm wondering if there's still a chance to get this patch applied before
> 2014.08 release?

My feeling is that it was submitted too late to get applied to 2014.08.
Generally speaking, we don't merge any version bump after -rc1 has been
tagged, unless those bumps are known to fix important issues.

Therefore, I believe this change qualifies for the next branch, and
will therefore be part of the 2014.11 Buildroot release.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
