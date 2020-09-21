From: Michael Nosthoff <buildroot@heine.tech>
Date: Mon, 21 Sep 2020 10:28:34 +0200
Subject: [Buildroot] [PATCH] package/live555: bump to version 2020.08.19
In-Reply-To: <20200919145215.20573071@windsurf.hq.k.grp>
References: <20200917214317.23734-1-buildroot@heine.tech>
 <20200919145215.20573071@windsurf.hq.k.grp>
Message-ID: <aec4640d-acf2-f36d-db7c-f08b1edbb4c0@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI,

On 19.09.2020 14:52, Thomas Petazzoni wrote:
> Hello Michael,
>
> +Fabrice in Cc.
> -by: Michael Nosthoff <buildroot@heine.tech>
> The static linking fix seems unrelated to the version bump, and this is
> the sort of fix we might want to backport.
>
> However, Fabrice already took a look at that static linking issue and
> has submitted a while ago some patches:
>
>   https://patchwork.ozlabs.org/project/buildroot/patch/20200713155135.1214109-1-fontaine.fabrice at gmail.com/
>   https://patchwork.ozlabs.org/project/buildroot/patch/20200713155135.1214109-2-fontaine.fabrice at gmail.com/

Oops, I wasn't aware of this patch. It is nicer than mine with finding
the dependencies :)
I don't have the original message so I can't reply to it directly. But I
compile tested it with

armv7-eabihf glibc bleeding-edge 2020.02-2
armv7m uclibc bleeding-edge 2018.11-1

and it runs through fine. So from my side that one is good to go.

I'll resend just the version bump.

Regards,
Michael
