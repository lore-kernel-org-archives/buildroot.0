From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 22:45:28 +0100
Subject: [Buildroot] [PATCHv2 1/2] package/lftp: don't use host's path
In-Reply-To: <1419712467-20090-1-git-send-email-romain.naour@openwide.fr>
References: <1419712467-20090-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141227224528.5ef54d62@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 27 Dec 2014 21:34:26 +0100, Romain Naour wrote:
> lftp try to link with -L/usr/lib/lftp/$(LFTP_VERSION) if
> DESTDIR is not set.
> 
> Remove useless -L option which point to a location where
> no libraries are installed.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v2: remove -L option instead of setting DESTDIR to STAGING_DIR
>     (ThomasP)

Applied, thanks. Please submit upstream to the lftp developers, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
