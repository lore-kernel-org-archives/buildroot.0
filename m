From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 4 Sep 2008 11:20:13 +1000
Subject: [Buildroot] XYZ_AUTORECONF = YES results in two autoreconf runs
In-Reply-To: <20080903053525.GA12148@cloud.net.au>
References: <20080903053525.GA12148@cloud.net.au>
Message-ID: <20080904012013.GB16933@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 03, 2008 at 03:35:25PM +1000, Hamish Moffatt wrote:
> Looking at Makefile.autotools.in, it appears that autoreconf is run
> twice is XYZ_AUTORECONF = YES.
> 
> The xyz-configure target depends on xyz-autoreconf, and the
> xyz-configure target itself runs autoreconf again.
> 
> Does anyone know a good reason for this?

I guess not - changed in r23313.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
