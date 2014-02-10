From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Feb 2014 13:26:10 +0100
Subject: [Buildroot] [git commit] gpsd: disable for microblaze arch
In-Reply-To: <20140208215953.2C5619C81A@busybox.osuosl.org>
References: <20140208215953.2C5619C81A@busybox.osuosl.org>
Message-ID: <20140210132610.76d31ad6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, Peter,

On Sat, 8 Feb 2014 22:53:41 +0100, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=d517415bcda380336f4a27bf248cef4d81791c9e
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> gpsd will fail on an internal compiler error for the microblaze
> architecture so disabling it on that architecture.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/42d/42da870722f24e4202d8265597771a0449e74cfd
> 
> [Peter: add comment explaining why]
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

I believe we should add a bug tracker entry for this issue and the
dmraid on ARC issue, assigned to Spenser (for the gpsd/microblaze
issue) and Anton (for the ARC/dmraid issue). I'd like to make sure we
keep track of them as they will no longer appear in the autobuilder
results. This will remind Spenser and Anton to do something about them.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
