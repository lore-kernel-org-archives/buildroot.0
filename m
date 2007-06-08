From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 8 Jun 2007 08:22:26 +0200
Subject: [Buildroot] Easier adding of new packages / alsa-lib & utils
References: <20070607132945.GC4224@firebird.dresden.micronet24.de>
Message-ID: <007501c7a995$663af6b0$0302a8c0@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi,
> 
> the attachment contains two patches. The first one will rapidly shorten
> the Makefile to add a new package to the buildroot (at least for most
> packages), while being fully compatible to the standard way used up to
> now.

As I see it we lack two things in the build.
1) Ability to use backup sites if the main site is temporarily or permanently down.
2) Handling of distributions.    I.E. ability to specify which package version you 
    want to build in a way which is separated from the package build script.
3) Ability to generate binary packages which can be added/removed from 
    the root fs.

Any chance of looking into this?
An alternative to this patch could be to use the OpenWRT build script
which does (1) and (3) above.

OpenWRT seems to be a split from buildroot.
Is there a heated history here?

> While the Config.in follows the same rules, the Makefile for the new
> package provides only the NEEDED information to add the package. Let see
> on an example (Its nearly the same included in the second patch):
> 


Best Regards
Ulf Samuelsson 
