From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Dec 2016 21:13:47 +0100
Subject: [Buildroot] [PATCH 1/2] gcc: disallow 4.8.x for ARMv8 cores
In-Reply-To: <20161206163618.1758-1-peter@korsgaard.com>
References: <20161206163618.1758-1-peter@korsgaard.com>
Message-ID: <20161206211347.69a9f64b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Dec 2016 17:36:17 +0100, Peter Korsgaard wrote:
> Notice: A53/A57 were in fact supported in aarch64 mode in 4.8 (in aarch32
> mode only from 4.9), but it doesn't handle --with-abi, and as there is
> unlikely to be any aarch64 based legacy projects unwilling to use a newer
> GCC version it is simpler to disallow it for all modes.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks!
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
