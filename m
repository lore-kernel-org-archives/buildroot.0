From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jul 2016 14:53:44 +0200
Subject: [Buildroot] [PATCH] package/alljoyn: fix SPARC build issue
In-Reply-To: <1468754074-14740-1-git-send-email-romain.naour@gmail.com>
References: <1468754074-14740-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160717145344.622864e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In the title: you're actually fixing a sparc64 build issue. Indeed,
alljoyn cannot be built on sparc since you added the sync_4 dependency
recently.

On Sun, 17 Jul 2016 13:14:34 +0200, Romain Naour wrote:
> Some of the serial port highest speed are not defined on SPARC, so
> alljoyn should not use them, so we add a patch to fix that.
> 
> From:

"From" is not very specific. Something like:

Inspired by commit ...

Would have been nicer.

> c5e96d8935016456bea342db170ae6a139a8470f
> 
> Fixes:
> http://autobuild.buildroot.net/results/e5b/e5b30b5e0d86b44b97410d434b771e1fb7b18de0

In the autobuilder URL you can remove    ^^^^

Also, please submit this patch upstream.

Applied with those nits fixed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
