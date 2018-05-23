From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 May 2018 10:32:10 +0200
Subject: [Buildroot] [PATCH 1/1] Adding support to conditionally build
 the GNAT Ada compiler in the toolchain.
In-Reply-To: <51E2F87E-1703-4DE0-BAFA-4FFA1AA0CFC9@gmail.com>
References: <20180521013248.22532-1-glen.m.cornell@gmail.com>
 <20180521102905.00f0a365@windsurf>
 <51E2F87E-1703-4DE0-BAFA-4FFA1AA0CFC9@gmail.com>
Message-ID: <20180523103210.50c7ac38@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 May 2018 07:23:15 -0400, Glen Cornell wrote:

> Thanks for the comments. I?ll update my patch in accordance with your
> comments and resubmit. 

Great, thanks!

> FYI - the libstdc++.a dependency I found strange as well.  Although I
> didn?t investigate the nature of the dependency, without it, the
> build fails

Then we'll have to do some research on this, because if libstdc++.a is
really needed on the host machine, we'll have to add a check in
support/dependencies/dependencies.sh for this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
