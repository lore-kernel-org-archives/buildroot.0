From: Stephan Hoffmann <sho@relinux.de>
Date: Thu, 06 Dec 2012 11:26:15 +0100
Subject: [Buildroot] [PATCH] make legal-info: fails with OVERRIDE_SRCDIR
In-Reply-To: <87y5hc8ffz.fsf@dell.be.48ers.dk>
References: <1354529151-17426-1-git-send-email-sho@relinux.de>
 <87y5hc8ffz.fsf@dell.be.48ers.dk>
Message-ID: <50C072C7.30901@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 05.12.2012 20:30, schrieb Peter Korsgaard:
>>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:
>  Stephan> There is a check for OVERRIDE_SRCDIR in pkg-generic.mk that is
>  Stephan> supposed to produce a warning when OVERRIDE_SRCDIR is active.
>  Stephan> This does not work and instead the whole make terminates with
>  Stephan> an error message.
>
>  Stephan> This patch changes the check for active OVERRIDE_SRCDIR so that
>  Stephan> it works as expected.
>
> Committed, thanks.
>
Hi,

sorry, but I forgot that Arnout's patch
http://lists.busybox.net/pipermail/buildroot/2012-October/059910.html is
not yet applied. My patch does not work without this.

Kind regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121206/040baca5/attachment.html>
