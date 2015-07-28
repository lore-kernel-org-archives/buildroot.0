From: Scott Fan <fancp2007@gmail.com>
Date: Tue, 28 Jul 2015 22:26:18 +0800
Subject: [Buildroot] [PATCH] freerdp: Add support for tz package
In-Reply-To: <20150728160353.7cc0b9ec@free-electrons.com>
References: <1438071916-13248-1-git-send-email-fancp2007@gmail.com>
 <20150728110713.74b1e037@free-electrons.com>
 <CAFkzVZaKVSv=-YU2pdqAf0eB9MSWFT8j7soCY0vhEwO7H_PxUg@mail.gmail.com>
 <20150728160353.7cc0b9ec@free-electrons.com>
Message-ID: <CAFkzVZZZyZqz+hoWqhLaeu78HX+nx=E4+0rxE1z_mZE-BmCOWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

you can merge the patch 501074, 501261 now,
pls abort the previous patch 501049, 501050

Scott Fan

On Tue, Jul 28, 2015 at 10:03 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Scott Fan,
>
> On Tue, 28 Jul 2015 21:45:55 +0800, Scott Fan wrote:
> > Sorry, my emails always been blocked by GFW in China, so i'm not sure
> > whether mails sent successfully. Just now, i've got a stable VPN
> connection.
> > I promise i won't repeat again.
>
> Ok, I understand. You can check whether your e-mail arrived to the list
> by checking the list archives:
>
>    http://lists.busybox.net/pipermail/buildroot/
>
> Note that it takes some time for the e-mails to get archived. I'm not
> sure how much, but maybe up to a few hours.
>
> > THIS patch should be independent from the patch series, which fixes the
> > error
> > message 'Unable to detect time zone' while the freerdp command connected
> a
> > remote desktop.
>
> Right, but it was part of your earlier patch series nonetheless.
>
> Could you have a look at
> http://patchwork.ozlabs.org/project/buildroot/list/, and tell us which
> of your patches are the latest ones and should still be considered for
> merging, and which ones are no longer current?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150728/40832c65/attachment.html>
