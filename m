From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Feb 2020 22:57:36 +0100
Subject: [Buildroot] [PATCH 1/3] package/erlang: bump to version 22.2
In-Reply-To: <20200129172618.16966-1-frank.vanbever@essensium.com>
References: <20200129172618.16966-1-frank.vanbever@essensium.com>
Message-ID: <20200201225736.4c899cf7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Johan: I really would like a Reviewed-by/Acked-by tag from you, as you
are the one typically taking care of erlang support in Buildroot.

On Wed, 29 Jan 2020 18:26:16 +0100
Frank Vanbever <frank.vanbever@essensium.com> wrote:

> The issue fixed by 0003-Link-with-LDLIBS-instead-of-LIBS-for-DED.patch (ERL-529)
> has been fixed since OTP20.3 (a5cbcbdb85) and is no longer required.
> 
> OTP provides wrapper scripts (otp_build and configure) which perform tasks
> previously handled directly by autotools i.e. autoreconf.
> 
> Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
