From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Mar 2018 10:08:22 +0200
Subject: [Buildroot] [PATCH v1 1/2] gnutls: needs C++ support
In-Reply-To: <87605it0kv.fsf@dell.be.48ers.dk>
References: <20180321202312.23021-1-ps.report@gmx.net>
 <87605it0kv.fsf@dell.be.48ers.dk>
Message-ID: <20180327100822.4ba3ac42@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Mar 2018 09:54:56 +0200, Peter Korsgaard wrote:

> It is a bit stupid that we have pull in C++ support here and in all the
> reverse dependencies just because of a stupid configure check, but I
> guess it is the simplest/best solution.
> 
> Should we then also revert bd39d11d2eaa679f (core/infra: fix build on
> toolchain without C++)?
> 
> Yann, Thomas, Arnout - What do you say?

I just fired up a build to reproduce the issue and have a look. But
from what I remember last time I had a look, it was just some
completely brain-damaged autoconf sorcery, and there wasn't really any
hope of fixing it.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
