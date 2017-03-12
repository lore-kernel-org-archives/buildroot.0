From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 14:21:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/exim: bump version to 4.89
In-Reply-To: <20170311151205.16649-1-bernd.kuhls@t-online.de>
References: <20170311151205.16649-1-bernd.kuhls@t-online.de>
Message-ID: <20170312142120.4af2ca51@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Mar 2017 16:12:05 +0100, Bernd Kuhls wrote:
> Rebased patch #0003, added uClibc compatibility patch.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I've applied, but I have a request below.

> -EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4/old
> +EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4

Could you get in touch with upstream, and ask them to stop moving
tarballs? This is *really* annoying for things like Buildroot.

Currently, 4.89 is in ftp://ftp.exim.org/pub/exim/exim4, but as soon as
they will release 4.90 (or whatever is the next version), they will
move the 4.89 tarball to ftp://ftp.exim.org/pub/exim/exim4/old/. This
is really really bad to make downloads reproducible on the long run.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
