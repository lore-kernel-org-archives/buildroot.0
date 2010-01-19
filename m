From: Andrew Wiley <debio264@gmail.com>
Date: Tue, 19 Jan 2010 00:16:55 -0600
Subject: [Buildroot] Firmware Loading
In-Reply-To: <201001160730.01752.minimod@morethan.org>
References: <ecbbfeda1001152337n477893fcubb861dc425d9d704@mail.gmail.com>
	<201001160730.01752.minimod@morethan.org>
Message-ID: <ecbbfeda1001182216g6c01fa67w3ab7a2bf1e234ca1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 16, 2010 at 7:29 AM, Michael S. Zick <minimod@morethan.org>wrote:
>
> Perhaps update the mdev configuration file?
> It ships empty, it has to, too installation specific to pre-define
> anything.
>
> mdev --help
> will start you off; continue as required with the command descriptions -
> if loaded on your machine during the build or at the busybox web-site.
>

Well, I wound up just going with udev, call me lazy if you like, but it
works for me. My board runs off a flash drive, so space isn't an issue. I
won't generally be adding or removing devices after startup, so performance
isn't really an issue either, but I may wind up swapping out devices that
are connected at boot time, so udev seemed like a better solution for my
setup.

Thanks,
Andrew
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100119/cc79a052/attachment.htm>
