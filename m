From: Martin Hicks <mort@bork.org>
Date: Mon, 28 Mar 2011 09:22:51 -0400
Subject: [Buildroot] OF FDT compilation support
In-Reply-To: <AANLkTimGE_8JQooPSJrkvDkM74mhf9Swj6m-cQwHzNeq@mail.gmail.com>
References: <AANLkTikeJ-mbrieukd24z7zZi=hCRMNPhMZWP+Okm2oX@mail.gmail.com>
	<20101123224505.1a26aeca@surf>
	<AANLkTimGE_8JQooPSJrkvDkM74mhf9Swj6m-cQwHzNeq@mail.gmail.com>
Message-ID: <AANLkTikxc5Wp0KYoYrGuYykPx8D5ZG88tmNMmpR5JjPt@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 26, 2011 at 4:28 AM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Stanislav,
>
> I haven't seen a follow-up on this. Have you ever considered sending
> an updated patch, based on Thomas' comments?

I also posted a patch last week to allow specifying an alternate
kernel make target, rather than the default 'bzImage', 'uImage', etc.
I'd much rather just leave FDT compilation to the kernel.  The
alternate make target, at least for powerpc boards, is how you tell
the kernel which FDT is used for your board.

mh

-- 
Martin Hicks P.Eng. ?? ? | ? ? ? ? mort at bork.org
Bork Consulting Inc. ? ? | ? +1 (613) 266-2296
