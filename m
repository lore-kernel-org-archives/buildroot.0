From: michal.lyszczek at bofc.pl <michal.lyszczek@bofc.pl>
Date: Mon, 05 Aug 2019 10:45:36 +0200
Subject: [Buildroot] [PATCH 01/13] new package: openrc-0.41.2
In-Reply-To: <20190804123019.GB25437@scaer>
References: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
 <20190804123019.GB25437@scaer>
Message-ID: <20190805084536.2e3wxvmn7ljgs5kn@c-ml-p3510.redembedded.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,
On 2019-08-04 14:30:19, Yann E. MORIN wrote:
> Micha?, All,
>
> Sorry for the long delay in replying to this series...

Nothing to worry about, really.

> During the developers meetging this week-end, I've reworked most of your
> series: https://patchwork.ozlabs.org/project/buildroot/list/?series=123190
>
> I've however left two patches behind:
>
>   - package/openrc: add support to set terminal encoding
>   - package/openrc: add support for setting terminal keymap
>
> We've discussed those two patches, and we agree that the feature is very
> useful. However, we would like to have something that is not entirely
> specific to openrc.
>
> Indeed, the config options (e.g. BR2_TARGET_GENERIC_TERM_KEYMAP) should
> be available for all init systems. The only part that should be specific
> to each init system should be how the options are applied.
>
> Finally, we would very much like to have run-time testing of openrc as
> an init system, like we have for busybox and systemd, see:
>     support/testing/tests/init/
>
> Would like to work on these two points, once the new series ahs been
> applied?

Yes, I can prepare tests and add generic support for setting terminal
encoding and keymap.

> Thank you for your very valuable initial work! :-)

And thank you for tweaking my changes :-)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190805/4959c672/attachment.asc>
