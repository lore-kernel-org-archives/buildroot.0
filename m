From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Mar 2018 21:22:55 +0100
Subject: [Buildroot] [V3 2/2] dropbear: unbundle libtomath & libtomcrypt
In-Reply-To: <20180321201608.jrkkauvpiwcla6js@tarshish>
References: <20180321160329.20768-1-francois.perrad@gadz.org>
 <20180321160329.20768-2-francois.perrad@gadz.org>
 <20180321170413.74jd5vq4ygcgbewp@tarshish>
 <20180321211310.50f6410c@windsurf>
 <20180321201608.jrkkauvpiwcla6js@tarshish>
Message-ID: <20180321212255.20f2e2bc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Mar 2018 22:16:08 +0200, Baruch Siach wrote:

> Here is my full commit on v2:
> 
> Since both libraries are static only, this does not reduce the binary size. On
> the other hand, bundled libraries are more likely to work correctly with any
> give version of dropbear. The only benefit of using external libraries is when
> there is a security update to the libraries. But unless there is a known issue
> now, I'm not sure it's worth it.
> 
> Do you see other reasons to prefer unbundling?

Well, exactly the one you mention: security issues.

In fact, I think you're putting the problem in the wrong direction. I
would rather say: "Unless there is a good reason to not use external
libraries, we should use external libraries rather than bundled ones".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
