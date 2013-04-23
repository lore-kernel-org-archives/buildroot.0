From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 23 Apr 2013 08:14:42 +0100
Subject: [Buildroot] [RFC] permit menu customization
In-Reply-To: <5175AAAA.5030503@mind.be>
References: <1366621622-7953-1-git-send-email-spdawson@gmail.com>
 <5175AAAA.5030503@mind.be>
Message-ID: <CAHt8ZCPx7bOGYKtJTemFh3NngjVOndP2Lv9ECjPdhET0r6=_bA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout; thanks for taking the time to look at this.

On 22 April 2013 22:24, Arnout Vandecappelle <arnout@mind.be> wrote:
>  A couple of patches with a similar purpose have been posted in the last
> year or so. However, at the last two buildroot developer meetings we've
> decided that this approach is not the way we want to go. Instead, adding
> custom packages should be done by including them directly at the top of
> packages/Config.in.

This seems like a missed opportunity to me --- especially when we can so easily
hook the configuration menu for user customization. It would be nice if local
packages could be added without having to edit buildroot itself. Do you --- or
others --- think that there is any point in pursuing this idea? The
fact that similar
patches have been proposed before would seem to suggest that this is something
that users would benefit from.

>  Another buildroot rule is that the build should never modify the buildroot
> directory itself when O= is specified on the command line. So the
> Config.in.user should at least be in the CONFIG_DIR rather than the TOPDIR.

Okay; thanks for the tip. I'll fix it if this patch survives into
another iteration.

Simon.
