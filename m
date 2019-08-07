From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Aug 2019 15:38:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: bump version to
 1.10.0
In-Reply-To: <20190807054006.18254-1-bernd.kuhls@t-online.de>
References: <20190807054006.18254-1-bernd.kuhls@t-online.de>
Message-ID: <20190807153830.4422e7cc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  7 Aug 2019 07:40:06 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://freeswitch.org/confluence/display/FREESWITCH/FreeSWITCH+1.10.x+Release+notes
> 
> Rebased 0001-Fix-cross-compiling-libvpx.patch.
> 
> Add mod_pgsql replacing PostgreSQL support in the core:
> https://freeswitch.org/jira/browse/FS-11880
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../freeswitch/0001-Fix-cross-compiling-libvpx.patch |  6 +++---
>  package/freeswitch/freeswitch.hash                   | 12 ++++++------
>  package/freeswitch/freeswitch.mk                     | 10 +++-------
>  3 files changed, 12 insertions(+), 16 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
