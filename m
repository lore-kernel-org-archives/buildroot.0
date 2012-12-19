From: Bogdan Radulescu <bogdan@nimblex.net>
Date: Wed, 19 Dec 2012 15:55:40 +0000
Subject: [Buildroot] [PATCH 2/4] gstreamer: port to gstreamer-1.0
In-Reply-To: <87d2y63zw3.fsf@dell.be.48ers.dk>
References: <1355916156-17973-1-git-send-email-bogdan@nimblex.org>
 <1355916156-17973-2-git-send-email-bogdan@nimblex.org>
 <8738z25i4i.fsf@dell.be.48ers.dk> <50D1BE2D.8060507@mind.be>
 <87d2y63zw3.fsf@dell.be.48ers.dk>
Message-ID: <CAKu+J90mqpKHGp=8HeCcryP65PRK3PUoFNY0fWmirgQgp2oVcg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry guys,

Yeah I've send to the wrong list.
gstreamer-1.0 has a slightly different API so it's not always a drop in
replacement.
I will send to the correct list and continue discussions there.

Bogdan


On Wed, Dec 19, 2012 at 2:00 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:

> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
> Hi,
>
>  Arnout>  OTOH, it's probably not needed to have them side-by-side, so it's
>  Arnout> probably sufficient to have a config option in
> BR2_PACKAGE_GSTREAMER
>  Arnout> to differentiate the two.
>
> True - If that doesn't complicate the .mk / Config.in too much.
>
>  Arnout>  I didn't see the original patches, so I can't say if it's easier
> to
>  Arnout> have them side-by-side or within a single package...
>
> It was accidentially sent to the busybox list instead. I've asked Bodgan
> to resend the series to the buildroot list.
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121219/e0069025/attachment-0001.html>
