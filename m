From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jan 2014 20:42:25 +0100
Subject: [Buildroot] [PATCH v2 1/1] transmission: Fix build error
 "conflicting types for 'UTP_Write'" after version bump
In-Reply-To: <BLU0-SMTP19793343AE004AB8BB60FDFD9CA0@phx.gbl>
References: <BLU0-SMTP19793343AE004AB8BB60FDFD9CA0@phx.gbl>
Message-ID: <20140103204225.0e1998be@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 3 Jan 2014 20:18:21 +0100, Bernd Kuhls wrote:
> fix taken from
> http://www.adminsehow.com/2012/10/how-to-install-transmission-2-71-on-debian-6-0-squeeze/
> 
> compile tested on arch sh4, fixes
> http://autobuild.buildroot.org/results/638/63884de929fb7339ebf44b08cb5d1ab30010666a/
> 
> should also fix powerpc
> http://autobuild.buildroot.org/results/eb4/eb486228a11a9602d4bf40e771744d2b2b40508f/
> 
> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
