From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 22:01:30 +0200
Subject: [Buildroot] [PATCH 1/2] package/ltp-testsuite: Fix m68k build
In-Reply-To: <20201002221032.5627-1-petr.vorel@gmail.com>
References: <20201002221032.5627-1-petr.vorel@gmail.com>
Message-ID: <20201008220130.042fe7ff@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  3 Oct 2020 00:10:31 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Backport upstream proposal for fix.
> 
> Fixes: br-m68k-68040-full failure.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> I haven't found this in autobuild [1], there are just problems with
> fanotify tests missing MAX_HANDLE_SZ, which are fixed in next version
> (second patch).

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
