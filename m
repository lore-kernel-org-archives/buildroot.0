From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 14:55:53 +0200
Subject: [Buildroot] [PATCH 1/3] go: patch to fix cross-compilation
 support
In-Reply-To: <20180511123845.fymqzohfcow7o4n6@bifrost>
References: <20180511101020.10295-1-anisse@astier.eu>
 <20180511101020.10295-2-anisse@astier.eu>
 <20180511130928.6211a644@windsurf.home>
 <20180511123845.fymqzohfcow7o4n6@bifrost>
Message-ID: <20180511145553.0f1fc46d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 May 2018 14:38:45 +0200, anisse at astier.eu wrote:

> > > I'm adding myself to the DEVELOPERS file in order to get CC-ed to future
> > > build failures.  
> > 
> > This should be done as part of a separate patch.  
> 
> That's what I thought, but the documentation stated otherwise:
> "[...] please add yourself to the DEVELOPERS file. This should be done
> in the same patch creating or modifying the package. [...]"
> 
> https://buildroot.org/downloads/manual/manual.html#submitting-patches

I think our documentation is wrong. It should be in the same patch when
creating the package, but not when modifying the package.

> Will be in the next version.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
