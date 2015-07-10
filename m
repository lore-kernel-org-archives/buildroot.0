From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 00:56:52 +0200
Subject: [Buildroot] [PATCH] qt - fix execution on ARC
In-Reply-To: <1432620833-5698-1-git-send-email-abrodkin@synopsys.com>
References: <1432620833-5698-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150711005652.1bb5ff0f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 26 May 2015 09:13:53 +0300, Alexey Brodkin wrote:
> Even though Qt4 could be built for ARC cores during execution
> of Qt4 applications on target issues will happen.
> 
> Most notable is will be segfaults due to unaligned access to data,
> especially in WebKit applications.
> 
> Both patches were submitted upstream and if they ever get accepted
> they should be removed from Buildroot.
> 
> https://codereview.qt-project.org/#/c/112667
> https://codereview.qt-project.org/#/c/112668
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Anton Kolesov <akolesov@synopsys.com>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...9-Add-initial-support-of-ARC-architecture.patch | 183 +++++++++++++++++++++
>  .../qt/0010-Prevent-unaligned-access-on-ARC.patch  |  92 +++++++++++
>  2 files changed, 275 insertions(+)
>  create mode 100644 package/qt/0009-Add-initial-support-of-ARC-architecture.patch
>  create mode 100644 package/qt/0010-Prevent-unaligned-access-on-ARC.patch

I've adjusted the commit title (qt: fix execution on ARC), renumbered
the patches and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
