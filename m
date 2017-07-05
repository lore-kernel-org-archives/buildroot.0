From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 23:31:33 +0200
Subject: [Buildroot] [git commit] toolchain: replace absolute symlinks
 by relative symlinks during sysroot copy
In-Reply-To: <20170705212308.3C6778043E@busybox.osuosl.org>
References: <20170705212308.3C6778043E@busybox.osuosl.org>
Message-ID: <20170705233133.6ab298e1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas, Peter,

> commit: https://git.buildroot.net/buildroot/commit/?id=b291525ac74273191c1a53a8361b9e7a6a58e79f
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I normally don't push such complicated patches directly without prior
review. However, the autobuilders were being spammed with this musl
toolchain problem, so I wanted to have a fix merged quickly.

I have obviously no problem to see your objections/comments about the
commit, and I'm willing to send follow-up patches to change/improve
this if needed.

I've tested it by running all our tests for external toolchains in
support/testing/.

Let me know if you have any comments.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
