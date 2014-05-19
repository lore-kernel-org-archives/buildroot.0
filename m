From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 May 2014 15:35:09 +0200
Subject: [Buildroot] [PATCH v4 3/3] Add an BR2_GCC_ENABLE_GRAPHITE flag
 for the buildroot toolchain
In-Reply-To: <BLU436-SMTP98CA6E3D3B3B921DF6B9BFA8320@phx.gbl>
References: <1400502054-9389-1-git-send-email-scjthm@live.com>
 <BLU436-SMTP98CA6E3D3B3B921DF6B9BFA8320@phx.gbl>
Message-ID: <20140519153509.1b0f7246@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Thomas,

On Mon, 19 May 2014 12:20:54 +0000, Steve Thomas wrote:
> The gcc graphite optimisations such as loop-interchange, blocking
> and loop-flattening, also known as graphite are an optional feature of
> gcc that is very well supported since about gcc version 4.5.
> 
> This patch adds support for graphite for the toolchain as an optional
> flag for versions 4.6 onwards as an optional flag, that is disabled by
> default.
> 
> Signed-off-by: Steve Thomas <scjthm@ive.com>
> ---
> Changes v3 -> v4:
>     - removing the parts not needed

I don't see any change in this patch between v3 and v4. And therefore
the comments I made on the v3 of your PATCH 3/3 were not addressed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
