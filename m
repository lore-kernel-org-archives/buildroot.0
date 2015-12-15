From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:11:01 +0100
Subject: [Buildroot] [PATCH 00/45] Comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151215221101.178f58ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 14 Dec 2015 10:10:39 -0300, Gustavo Zacarias wrote:
> This series sanitizes the PKG_LICENSE entries.
> No attempt is made to interpret and/or improve upton the conditions of
> each license, it's just a style fix.

I've applied the 44 patches (i.e all of them except 03/45, which had a
typo, and for which I had already applied your v2).

Regarding the last four patches (lttng-*), I also changed the
description to put what is covered by each license between parenthesis.
I.e instead of:

	GPLv2 for foo, LGPLv2 for baz

I've used:

	GPLv2 (foo), LGPLv2 (baz)

Which is more consistent with what we do in other packages.

Thanks for this cleanup!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
