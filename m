From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Nov 2014 15:43:40 +0100
Subject: [Buildroot] [PATCH 0/4] rt-tests: patches rename & versoin bump
 & support of non-NPTL tools
In-Reply-To: <1415613549-2886-1-git-send-email-abrodkin@synopsys.com>
References: <1415613549-2886-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20141111154340.258edd64@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 10 Nov 2014 12:59:05 +0300, Alexey Brodkin wrote:

> Alexey Brodkin (4):
>   rt-tests: rename patch to the new convention
>   rt-tests: switch site from Debian snapshot to Linux's git
>   rt-tests: bump version to 0.89
>   rt-tests: allow building subset of tests with non-NPTL toolchains

Applied patches 1 to 3. Patch 4 not applied as a new version was sent.
However, I wanted to mention two things:

 * You should never resend a new version of just one patch. Always send
   the complete series again, even if only one patch has changed. I was
   mistaken when looking at patchwork, and originally only applied the
   patch removing the NPTL dependency, because it was available
   standalone, outside of any series.

 * You should use 'git format-patch -M' to enable rename detection. It
   would have made patch 1 a lot smaller, and easier to review.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
