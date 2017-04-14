From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Apr 2017 22:35:47 +0200
Subject: [Buildroot] [PATCH 1/5] package/efl: remove lefover
 disable-wayland option
In-Reply-To: <20170414121345.10026-1-romain.naour@gmail.com>
References: <20170414121345.10026-1-romain.naour@gmail.com>
Message-ID: <20170414223547.0e5b71f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Apr 2017 14:13:41 +0200, Romain Naour wrote:
> Wayland support was re-added by [1] but the --disable-wayland option
> was not removed from EFL_CONF_OPTS.
> 
> [1] f30eec41f95ed99909eb2c7590d83c12b9142df2
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/efl/efl.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
