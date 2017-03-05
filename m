From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:47:34 +0100
Subject: [Buildroot] [PATCH] chocolate-doom: bump to version 2.3.0
In-Reply-To: <CABLs7GWTJGbxg9z4cY01OT+FE4PHLqONUCaG1f5KSPzmqbQFyQ@mail.gmail.com>
References: <1488739214-32676-1-git-send-email-rprebello@gmail.com>
 <20170305212528.2c2402bc@free-electrons.com>
 <CABLs7GWTJGbxg9z4cY01OT+FE4PHLqONUCaG1f5KSPzmqbQFyQ@mail.gmail.com>
Message-ID: <20170305214734.59f437ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Mar 2017 17:39:08 -0300, Rodrigo Rebello wrote:
> Not really. There's still one remaining patch
> (0004-configure-Switch-to-pkg-config-macros.patch) which unfortunately
> touches configure.ac. Only the ones which have been merged upstream
> were removed.

Ah, yes, sorry, I missed that one when looking at the list of patches.

> The next chocolate-doom release (v3.0.0) will use SDL2, and that wil
> include changes on the configure script to use pkg-config for finding
> libraries, so we'll be able to get rid of that last remaining patch
> when this version comes out. For now, however, v2.3.0 is the latest
> stable release.

Sure. Thanks, I'll apply your patch then.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
