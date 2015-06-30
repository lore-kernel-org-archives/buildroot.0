From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 16:43:50 +0200
Subject: [Buildroot] [PATCH] package/x11r7/xdiver_xf86-input-tslib:
 update download url
In-Reply-To: <1434294122-4664-1-git-send-email-romain.naour@openwide.fr>
References: <1434294122-4664-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150630164350.2a6ecf9f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 14 Jun 2015 17:02:02 +0200, Romain Naour wrote:
> The old url fallback to http://www.pengutronix.de/software/ptxdist/ instead
> of http://www.pengutronix.de/software/xf86-input-tslib/download/ breaking
> the download.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks. I've amended the commit to add a hash file, which
should help avoid such issues in the future.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
