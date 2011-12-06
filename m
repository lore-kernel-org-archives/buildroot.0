From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 06 Dec 2011 12:58:55 +0100
Subject: [Buildroot] [RFC] Request for comments on branch
	for-2011.11/host-tools
In-Reply-To: <cover.1317481137.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317481137.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4EDE037F.2080707@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Hello,
>
> Here is a small set of patches implementing the recent discussion we
> had about exposing host utilities. It exposes host-uboot-tools and
> host-openocd into a new "Host utilities" main menu.
>
> This is just to see if this looks like something that matches what we
> discussed, and something that Peter would accept.

Both this patch set has and the underlying idea (see original thread at
http://lists.busybox.net/pipermail/buildroot/2011-September/045939.html)
have been commented positively by some Buildroot users and developers,
and IIRC there was no NAK to the general idea.

Peter, are you considering these changes for mainline inclusion?

I would be happy to add host-u-boot-utils to the new menu once it's
merged.

Thanks,
Luca
