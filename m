From: Biser Milanov <bmilanov11@gmail.com>
Date: Thu, 1 Feb 2018 09:42:15 +0200
Subject: [Buildroot] [PATCH] Updated Liberation fonts source site
In-Reply-To: <87d11q58u4.fsf@dell.be.48ers.dk>
References: <CALoEJ8yDeSfTKw1=GYr_vCUGn7h7fD8VgxD6vjKZLJyk-sy=WA@mail.gmail.com>
 <20180131151033.dwdja6i3heisr6ef@sapphire.tkos.co.il>
 <87d11q58u4.fsf@dell.be.48ers.dk>
Message-ID: <CALoEJ8xiCvaT=ig61dXZBHMaA1JwOTJvxN0trGxStAoz=gDOHg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, I was working on the 2017.02.x branch, and didn't check master. I have
just pulled and am seeing the 53c07aa3a24d0f0a647e0e6858af5e65c6e81833 in
2017.02.x. Thanks!

On Wed, Jan 31, 2018 at 5:47 PM, Peter Korsgaard <peter@korsgaard.com>
wrote:

> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
>
> Hi,
>
>  >> LIBERATION_VERSION = 2.00.1
>  >> -LIBERATION_SITE = http://www.fedorahosted.org/
> releases/l/i/liberation-fonts
>  >> +LIBERATION_SITE = https://releases.pagure.org/liberation-fonts
>  >> LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
>  >> LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
>  >> LIBERATION_LICENSE = OFLv1.1
>
>  > This change is in the Buildroot master branch since last March:
>
>  >   https://git.busybox.net/buildroot/commit/?id=
> 53c07aa3a24d0f0a647e0e6858af5e65c6e81833
>
>  > Peter, I guess we need this in the 2017.02.x branch as well.
>
> Indeed, I've cherry picked it now. Normally this wouldn't be a problem
> as Buildroot falls back to sources.buildroot.net, but as the web server
> wasn't working ..
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180201/8248902f/attachment.html>
