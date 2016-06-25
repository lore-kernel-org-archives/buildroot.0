From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jun 2016 15:42:57 +0200
Subject: [Buildroot] [PATCH v2] fs/tar: support passing long options to
 tar
In-Reply-To: <1466783876-7597-1-git-send-email-fhunleth@troodon-software.com>
References: <1466783876-7597-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20160625154257.40e8a952@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Jun 2016 11:57:56 -0400, Frank Hunleth wrote:
> Move TAR_OPTS so that long options (or any option with an initial '-')
> may be passed to tar. Since TAR_OPTS is at the front of the list, single
> letter options still work.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
> Changes v1 -> v2:
>   - Move TAR_OPTS to front to preserve backward compatibility
>     (suggested by Arnout)
>   - Removed additional help text since no backward compatibility issues
>     were introduced.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
