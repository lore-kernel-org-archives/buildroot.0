From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 14:58:37 +0200
Subject: [Buildroot] [PATCH v2] agg: new package
In-Reply-To: <1398351989-24238-1-git-send-email-julien.boibessot@free.fr>
References: <1398351989-24238-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20140803145837.21252e16@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Julien,

On Thu, 24 Apr 2014 17:06:29 +0200, julien.boibessot at free.fr wrote:
> From: Julien Boibessot <julien.boibessot@armadeus.com>
> 
> 
> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
> ---
>  This library will be needed by gnash (soon coming Flash player).
> 
>  Changes since v1:
>  * Took Arnout/Thomas/Yann remarks into account:
>    - add comments for AGG_AUTORECONF usage and sdl-prefix redefinition,
>    - fixes license (comments welcome),
>    - add a patch to fixes autoreconf problems previously hacked directly in agg.mk
>    - changed commit Subject

Numerous comments were made on this package when you submitted this v2,
but you haven't submitted a new, updated version of this package, even
though the comments date back from early May. I'll therefore mark this
patch as "Changes Requested" in our patch tracking system. Could you
resubmit an updated version, preferably with the 'gnash' package as
well, so that it's clear what agg will be useful for?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
