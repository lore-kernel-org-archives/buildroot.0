From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 12:40:38 +0200
Subject: [Buildroot] [PATCH 1/4] Package netsnmp: Created start(), stop(),
	reload().
In-Reply-To: <87bn2g9w0h.fsf@dell.be.48ers.dk>
References: <1456435484-4723-1-git-send-email-universeII@gmx.de>
 <20160701150121.7eebcb5e@free-electrons.com>
 <87bn2g9w0h.fsf@dell.be.48ers.dk>
Message-ID: <20160702124038.358c9c15@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 02 Jul 2016 12:25:50 +0200, Peter Korsgaard wrote:

> For the future, please use your full name in the From: as well (git
> commit user.name "Andreas Ehmanns"). Now these commits are listed as
> being from "universe II".

Yeah, also noticed that, but after pushing :-/ The Signed-off-by line
is more visible and that one was correct, so I didn't notice.

Sadly, the new pedantic git commit hook checks that the e-mail between
the From and the SoB line are matching, but not the name itself.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
