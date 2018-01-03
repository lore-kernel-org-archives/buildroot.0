From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 23:27:07 +0100
Subject: [Buildroot] [PATCH] kvm-unit-test: revert use of RDSEED and
 RDRAND
In-Reply-To: <20171218084954.54776e85@windsurf>
References: <20171207043631.9312-1-matthew.weber@rockwellcollins.com>
 <20171214094459.4b383336@windsurf.png.is.keysight.com>
 <CANQCQpaDCyJLRZRk5mwun3sGy1Ex7WVZO5E35YZM02m-Synv-g@mail.gmail.com>
 <20171218084954.54776e85@windsurf>
Message-ID: <20180103232707.1e834d98@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Dec 2017 08:49:54 +0100, Thomas Petazzoni wrote:

> On Fri, 15 Dec 2017 14:41:05 -0600, Matthew Weber wrote:
> 
> > It isn't really a bug upstream.  I think the long term fix would be a
> > check for a minimum binutils version.  
> 
> Or kvm-unit-tests could do a configure test to verify if
> rdseed/rdrand are supported, and only use them if so.

Any chance you could submit a patch implementing this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
