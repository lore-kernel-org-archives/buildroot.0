From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 14:36:23 +0100
Subject: [Buildroot] [PATCH] package/fontconfig: Fix UUIDD dependency
In-Reply-To: <CAOf5uw=cG3nm8mWfVyuauDoTzE6i0XAvQ_K=bocyEdbJmFAV3Q@mail.gmail.com>
References: <20191224112330.14173-1-michael@amarulasolutions.com>
 <20191224134557.43cadbf2@windsurf>
 <CAOf5uw=cG3nm8mWfVyuauDoTzE6i0XAvQ_K=bocyEdbJmFAV3Q@mail.gmail.com>
Message-ID: <20191224143623.2cbdcf55@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Dec 2019 13:56:37 +0100
Michael Nazzareno Trimarchi <michael@amarulasolutions.com> wrote:

> > Indeed, fontconfig does not fail to build in the autobuilders, so I'd
> > like to understand what is the exact issue, and make sure we are doing
> > the right fix.  
> 
> Give time to build from clean again. I will send you the log

Could you also share the .config, or even better, a minimal
configuration that exhibits the issue ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
