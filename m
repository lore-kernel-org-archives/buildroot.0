From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 13:19:24 +0200
Subject: [Buildroot] [PATCH v4] gcc: explicitly use
 C{XX}FLAGS_FOR_TARGET instead of --enable-target-optspace
In-Reply-To: <1411470616.8968.3.camel@abrodkin-8560l.internal.synopsys.com>
References: <1409558133-17642-1-git-send-email-abrodkin@synopsys.com>
 <1410155602.4784.1.camel@abrodkin-8560l.internal.synopsys.com>
 <1410787751.5875.30.camel@abrodkin-8560l.internal.synopsys.com>
 <1411470616.8968.3.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <20140923131924.2334adec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 23 Sep 2014 11:10:16 +0000, Alexey Brodkin wrote:

> > > I'm wondering if this version is fine and we may go ahead an apply it?
> > 
> > Please treat this as a polite reminder about this pending patch.
> 
> Any chance for this change to made its way into upstream Buildroot?

Yes. Please give us some time to test it before applying it. It's
touching a fairly sensitive area, so we don't apply such patches
lightly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
