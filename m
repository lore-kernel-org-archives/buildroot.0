From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 6 Nov 2014 11:59:32 +0000
Subject: [Buildroot] [PATCH] uclibc: respect top-level TARGET_CFLAGS
In-Reply-To: <20141106115120.GG2234@tarshish>
References: <1415274442-24547-1-git-send-email-abrodkin@synopsys.com>
 <20141106115120.GG2234@tarshish>
Message-ID: <1415275171.11764.9.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Thu, 2014-11-06 at 13:51 +0200, Baruch Siach wrote:
> Hi Alexey,
> 
> On Thu, Nov 06, 2014 at 02:47:22PM +0300, Alexey Brodkin wrote:
> > When BR2_TARGET_OPTIMIZATION is used (with some specific compiler flags)
> > it's expected that ALL target binaries will be built with specified options.
> > 
> > Currently uClibc is built with its own set of options.
> > This change allows passing additional flags to uclibc build system.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > 
> > Cc: Anton Kolesov <akolesov@synopsys.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> Have you actually CCed all these addresses? I only see Thomas in the Cc: 
> header, besides you.

That's why I add "Cc:" in commit message.
Because "git send-email" automatically adds mentioned addresses to CC.

That's an extract of "git send-email" log:
--->---
MAIL FROM:<abrodkin@synopsys.com>
RCPT TO:<buildroot@buildroot.org>
RCPT TO:<abrodkin@synopsys.com>
RCPT TO:<akolesov@synopsys.com>
RCPT TO:<thomas.petazzoni@free-electrons.com>
RCPT TO:<peter@korsgaard.com>
RCPT TO:<gustavo@zacarias.com.ar>
RCPT TO:<Vincent.Riera@imgtec.com>
From: Alexey Brodkin <abrodkin@synopsys.com>
To: buildroot at buildroot.org
Cc: Alexey Brodkin <abrodkin@synopsys.com>,
	Anton Kolesov <akolesov@synopsys.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Peter Korsgaard <peter@korsgaard.com>,
	Gustavo Zacarias <gustavo@zacarias.com.ar>,
	Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Subject: [PATCH] uclibc: respect top-level TARGET_CFLAGS
Date: Thu,  6 Nov 2014 14:47:22 +0300
Message-Id: <1415274442-24547-1-git-send-email-abrodkin@synopsys.com>
X-Mailer: git-send-email 1.9.3
--->---

-Alexey
