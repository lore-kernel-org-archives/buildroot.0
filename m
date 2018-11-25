From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Nov 2018 09:23:31 +0100
Subject: [Buildroot] [PATCH next] stress-ng: bump to version 0.09.47
In-Reply-To: <20181125001408.6595-1-casantos@datacom.com.br>
References: <20181125001408.6595-1-casantos@datacom.com.br>
Message-ID: <20181125092331.0c5d6862@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Nov 2018 22:14:08 -0200, Carlos Santos wrote:
> - Enable for uClibc, which is supported now.
> - Keep microblaze, nios2 and arc restrictions, since it was not possible
>   to test on those architectures (no hardware available).
> - Keep musl restriction, since it was possible to compile the code (with
>   some patches) but it failed at run time with
> 
>     Cannot set scheduler: errno=38 (Function not implemented)
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
>  package/stress-ng/Config.in      | 7 +++----
>  package/stress-ng/stress-ng.hash | 2 +-
>  package/stress-ng/stress-ng.mk   | 2 +-
>  3 files changed, 5 insertions(+), 6 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
