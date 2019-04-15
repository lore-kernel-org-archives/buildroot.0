From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 14:39:10 +0200
Subject: [Buildroot] Short question about: [autobuild.buildroot.net]
 Your build results for 2019-04-14
In-Reply-To: <alpine.DEB.2.20.1904150914260.19094@defender.svolli.xa>
References: <E1hFufX-00081y-E0@svolli.dynxs.de>
 <alpine.DEB.2.20.1904150914260.19094@defender.svolli.xa>
Message-ID: <20190415143910.7580f187@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sven,

On Mon, 15 Apr 2019 09:18:08 +0200 (CEST)
Sven Oliver Moll <svolli@svolli.de> wrote:

> Hello Thomas,
> 
> I've got a question about this build fail. I'm pretty sure, Arnout fixed 
> this already: 
> https://git.busybox.net/buildroot/commit/?id=152a3f0be3ae180a470c7a7d86b363bd0af18d02
> 
> Let's assume I'm wrong. Will I then get another mail, if the build fails 
> again?

The autobuilder result you're pointing to, i.e
http://autobuild.buildroot.net/results/c7540203a8eadad3f324f0d7e7fe66a526d4a2e9,
has a file that indicates which Buildroot Git commit was used when the
build was done:

  http://autobuild.buildroot.net/results/c7540203a8eadad3f324f0d7e7fe66a526d4a2e9/gitid

It says 51d6d6c580432435f2b2f95ed35e22a5ecbe9dcb, which indeed predates
commit 152a3f0be3ae180a470c7a7d86b363bd0af18d02, where parallel build
for 'most' was disabled.

So indeed, it is very likely that Arnout's patch fixed this issue.
You'll receive other e-mail reports if there are other build failures.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
