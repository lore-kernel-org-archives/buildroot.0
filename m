From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 22:09:51 +0200
Subject: [Buildroot] [PATCH 1/1 v2] package/libsepol: Remove use of
 cdefs.h
In-Reply-To: <1468014336-25570-1-git-send-email-Aduskett@gmail.com>
References: <1468014336-25570-1-git-send-email-Aduskett@gmail.com>
Message-ID: <20160725220951.7f9b2b69@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  8 Jul 2016 17:45:36 -0400, Adam Duskett wrote:
> Libsepol uses cdefs.h which is a internal glibc header.
> This header is not intended to be used by any program and will cause
> compiling against musl (and possibly other c libraries) to fail.
> This patch fixed this issue and replaces all references of
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---

That's a pretty big patch, so I hope it will be accepted upstream.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
