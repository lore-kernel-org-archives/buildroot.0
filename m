From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Apr 2019 23:23:57 +0200
Subject: [Buildroot] [PATCH 1/2] pkgconf: bump to version 1.6.1
In-Reply-To: <20190409232300.1b76d55c@windsurf.home>
References: <20190409175919.25833-1-aduskett@gmail.com>
 <20190409232300.1b76d55c@windsurf.home>
Message-ID: <20190409232357.5dfb8812@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Sorry, I hit Ctrl+Enter too early :-/

On Tue, 9 Apr 2019 23:23:00 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> The pkg-config issue with variables being sometimes prefixed by the
> sysroot sometimes not simply cannot be fixed, because pkg-config has
> no idea whether the variable is meant to be used a build time (needs
> to be prefixed by the sysroot) or at run time (must NOT be prefixed
> by the sysroot).

So I don't really understand what you mean by "works properly for
--variable".

Of course, besides that the patch itself looks OK.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
