From: Michel Wilson <michel@crondor.net>
Date: Wed, 10 Sep 2008 13:52:14 +0200
Subject: [Buildroot] [PATCH] Option to disable cursor in X; retry
In-Reply-To: <20080910110310.GB18852@cloud.net.au>
References: <20080910081259.GB24785@aeon.hgd.crondor.net>
	<20080910110310.GB18852@cloud.net.au>
Message-ID: <200809101352.14211.michel@crondor.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 10 September 2008 13:03:10 Hamish Moffatt wrote:
> Does this disable the cursor completely, or add the ability to disable
> it through an API or configuration item?
>
> Because if it just plain disables the cursor that doesn't seem to be
> appropriate for a compile time option. (Not that it's your fault of
> course.)
>
>
> Hamish
You are as surprised as I was, because it is indeed a configure-time option to 
disable it, by default. Note that it's only the root window which is affected. 
I think it's possible to still have a cursor, by providing a cursor theme or 
something like that, but I haven't tested.
Question is: should this be included or not? I feel it's a useful option to 
have, because it's the simplest way of disabling the cursor. I tried a 
transparent cursor theme (see http://matchbox-project.org/sources/utils/), but 
didn't get it to work, yet. More elegant would be a xorg.conf option with the 
same effect, but I'm not sure if I'm up to that ;)

Regards,

Michel Wilson.
-- 
Michel Wilson     michel at crondor.net
PGP key ID        0xD2CB4B7E
