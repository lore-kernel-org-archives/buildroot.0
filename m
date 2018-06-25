From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 25 Jun 2018 23:30:47 +0000
Subject: [Buildroot] [arc-buildroot] Re: [PATCH] toolchain: Bump ARC
 tools to arc-2018.03 release
In-Reply-To: <20180625215719.4a04bde3@windsurf.home>
References: <20180625154535.21098-1-didin@synopsys.com>
 <20180625215719.4a04bde3@windsurf.home>
Message-ID: <2dbb659af2557f7e70e267b84b7a0360de2b5201.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2018-06-25 at 21:57 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 25 Jun 2018 18:45:35 +0300, Evgeniy Didin wrote:
> > This commit finally bumps ARC tools to the most recent arc-2018.03 release version.
> > 
> > ARC GNU tools of version arc-2018.03 bring some quite significant changes like:
> > * Binutils v2.29.51 with additional ARC patches
> > * GCC 7.3.1 with additional ARC patches
> > * GDB 8.0.50 with ARC patches
> > 
> > More information on this release could be found here:
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_foss-2Dfor-2Dsynopsys-2Ddwc-2Darc-2Dprocessors_toolchain_releases_tag_arc-2D2018.0
> > 3-2Drelease&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=_gxP0Lg1q0s6NbqCqmHUFlJIjsVhLOhTWctrX-
> > lOxf0&s=qq7xPxfRsWX5s2wkJ7MMG-wrV_83O_ezhVwxmi61-bE&e=
> > 
> > Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: arc-buildroot at synopsys.com

[snip]

> This patch did not apply to master as-is, due to the changes on gdb
> that Peter merged yesterday. I fixed up the conflict and applied to
> master.
> 
> I also did a follow-up commit, to make sure BR2_PACKAGE_GDB_NEEDS_CXX11
> is enabled when the ARC version of gdb is used: it's based on GDB 8.0,
> so it needs C++11 support.

Any chance for this one to be applied to 2018.05.x branch as this is just
RC2->Release bump?

-Alexey
