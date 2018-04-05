From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Apr 2018 22:38:23 +0200
Subject: [Buildroot] [PATCH 01/23] support/config-fragments/autobuild:
 remove Blackfin configuration
In-Reply-To: <20180405202933.GB22364@scaer>
References: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
 <20180405195037.32641-2-thomas.petazzoni@bootlin.com>
 <20180405202933.GB22364@scaer>
Message-ID: <20180405223823.37e9e07a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 5 Apr 2018 22:29:33 +0200, Yann E. MORIN wrote:

> > -# Test a noMMU toolchain with dynamic library support
> > -support/config-fragments/autobuild/br-bfin-full.config,x86_64  
> 
> Do we plan on adding back another noMMU target with dynamic library
> support instead of that one?

We don't have any other noMMU target that supports dynamic library
support currently. FDPIC support on ARM is being worked on upstream,
but I don't think it's ready yet.

Otherwise, there is FDPIC support for SH2, but we don't have support
for this either.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
