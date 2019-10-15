From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Oct 2019 21:40:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 12.12.0
In-Reply-To: <CAFGQKxcpOUnGfCwEusTYX3g8JnJmY5LuCHUYb+tsYSL=CWbD0g@mail.gmail.com>
References: <20191014145358.62394-1-james.hilliard1@gmail.com>
 <20191014230700.0b4ca358@windsurf.home>
 <CAFGQKxcpOUnGfCwEusTYX3g8JnJmY5LuCHUYb+tsYSL=CWbD0g@mail.gmail.com>
Message-ID: <20191015214051.13914496@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Martin,

On Tue, 15 Oct 2019 18:57:54 +0100
Martin Bark <martin@barkynet.com> wrote:

> > Martin: since this is a fairly big bump, I'd really like to have your
> > Reviewed-by/Tested-by on this patch. Thanks!  
> 
> We decided to stick the the LTS version of nodejs in buildroot.  The
> active LTS version is 10.16.3.  12.x is due to become the active LTS
> version next week.  I think we should just wait until then before
> bumping the version.

If 12.x is going to become the next LTS starting from next week, then
it means it will be ready for the 2019.11 release, so we should rather
have it as soon as possible in Buildroot, to give it as much testing
time as possible.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
