From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 22:55:21 +0100
Subject: [Buildroot] [PATCH v4 next 1/5] support/download: silence git
 if it is a silent build
In-Reply-To: <20141126214442.GB4260@free.fr>
References: <1416837422-1977-1-git-send-email-fabio.porcedda@gmail.com>
 <1416837422-1977-2-git-send-email-fabio.porcedda@gmail.com>
 <20141126213534.GA4260@free.fr>
 <20141126223822.6083acac@free-electrons.com>
 <20141126214442.GB4260@free.fr>
Message-ID: <20141126225521.591e46d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 26 Nov 2014 22:44:42 +0100, Yann E. MORIN wrote:

> Well, the fact that we relied on the fact that -q is optional so had to
> be the fifth argument is what bothered me. If we were to be adding new
> optional flags, we'd be stuck. Passing them through the environment made
> it possible to add extra optional flags (although I wonder what those
> might be).

Yes, agreed: what bothered me is to start having optional arguments,
but use only the position of arguments. This clearly makes it difficult
to have additional optional arguments

> No need to recognise long options, though; shirt options are enough.

Agreed, short options are good enough.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
