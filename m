From: Thomas Lundquist <lists@zelow.no>
Date: Wed, 21 Feb 2007 16:16:12 +0100
Subject: [Buildroot] Xorg.
In-Reply-To: <45DB07FC.7060100@ibsdisplay.de>
References: <20070220134253.GA24769@zelow.no> <45DB07FC.7060100@ibsdisplay.de>
Message-ID: <20070221151612.GA23972@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 20, 2007 at 03:38:52PM +0100, F.Roch wrote:

> you have to provide the xkbfile library on your build system.
> do this by installing a xorg on your build machine.

It's there now, together with the patch but same thing happens.

I tried to add another -L but then I'd have to use -rpath and such to
tell configure where uClibc resides (which makes kinda sense.)

I think I'd rather try to compile a newer xorg (I may even need it) than
go further with this one. 

Or do you have any plans to do it in the next few days? :=)



Thomas.
