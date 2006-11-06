From: Nathanael D. Noblet <nathanael@gnat.ca>
Date: Mon, 06 Nov 2006 14:29:31 -0700
Subject: [Buildroot] Suggestion, Keep version in a separate file.
In-Reply-To: <LS3rmy351Zd4.Fk5h2M9g@mailout.dof.se>
References: <LS3rmy351Zd4.Fk5h2M9g@mailout.dof.se>
Message-ID: <1162848571.7568.21.camel@iridium.gnat.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2006-11-06 at 22:29 +0200, Ulf Samuelsson wrote:
> I believe it would be a good
> idea to separate the version
> info and download site 
> from the <package>.mk.
> and keep a central file
> with this info.
> 
> This would make it easier
> to handle several projects
> using different versions
> of packages with the same
> framework.
> As part of this I think patches
> to packages should reside
> in a subdirectory to the
> main package directory.

Though I don't know if the implementation idea is the same, I would
*love* a system that allows me to build multiple root fs, and keep the
versions of all packages etc. so that I can reproduce it at will and/or
upgrade a package version for only one target. I started working on
something similar to what you are suggesting, but then my RAID 5 array
had 1 drive die, and bad blocks on the second grrrr so I've lost all
that I had done. I would be interested in helping. I think the main
point to success for something like this is that without any work on
everyone elses part buildroot needs to continue to function as it does
now for the most part, but those of us that want to be able to use it as
you describe could, without much difficulty.
-- 
Nathanael D. Noblet <nathanael@gnat.ca>
Gnat Solutions, Inc
