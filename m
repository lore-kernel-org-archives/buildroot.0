From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 15:46:12 +0100
Subject: [Buildroot] [PATCH] package: add qt5virtualkeyboard
In-Reply-To: <20170320142005.a6jb32nyfdiypdxd@gportay>
References: <20170317164628.5029-1-gael.portay@savoirfairelinux.com>
 <20170318152235.0be2d895@free-electrons.com>
 <20170320142005.a6jb32nyfdiypdxd@gportay>
Message-ID: <20170320154612.0b3a9f6e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for reviewing your own patch :)

On Mon, 20 Mar 2017 10:20:05 -0400, Ga?l PORTAY wrote:

> Also, I am working of installing language layouts.
> 
> For now, Chinese, Korean and Japanese layouts do no work properly; others are
> fined.
> 
> About the integration of a selection of layouts, I cannot make the decision
> between a select or a string kconfig entry. I think the string entry has the
> advantage to not to have to maintain a hardcoded list; this list would evoluate
> between Qt versions...
> 
> Would you prefer a select or a string?

Yes, a string is better, with a default value of having say just
english installed.

Regarding Chinese, Korean and Japanese, if you don't need them, and you
leave them as non-working, it's fine with me. People interested can
always build on top of what you did, and fix the issue with those
languages. We don't require a package that supports all options and
possibilities.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
