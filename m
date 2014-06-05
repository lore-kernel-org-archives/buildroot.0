From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 05 Jun 2014 08:41:01 +0200
Subject: [Buildroot] [PATCH v6 0/4] rpi-userland/xbmc fixes
In-Reply-To: <1401923053-30292-1-git-send-email-s.martin49@gmail.com>
References: <1401923053-30292-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1c6f8b25-140e-4645-90b4-b26eb20933c5@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,


On June 5, 2014 1:04:09 AM CEST, Samuel Martin <s.martin49@gmail.com> wrote:
>Samuel Martin (3):
>  xbmc: fix missing libraries from rpi-userland
>  rpi-userland: add patch fix missing libvcilcs install rules
>  rpi-userland: cleanup *_CONF_OPT

You forgot to propagate my acked-and-tested tags on patches 1 and 3.

Regards,
Yann E. MORIN.

>Yann E. MORIN (1):
>  package/libcec: fix missing libraries from rpi-userland
>
> package/libcec/libcec.mk                           |  1 +
>...vmcs_host-add-install-rules-for-libvcilcs.patch | 23
>++++++++++++++++++++++
> package/rpi-userland/rpi-userland.mk               |  2 +-
> package/xbmc/xbmc.mk                               |  3 ++-
> 4 files changed, 27 insertions(+), 2 deletions(-)
>create mode 100644
>package/rpi-userland/rpi-userland-003-interface-vmcs_host-add-install-rules-for-libvcilcs.patch
>
>--
>2.0.0
>
>_______________________________________________
>buildroot mailing list
>buildroot at busybox.net
>http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140605/79256f66/attachment.html>
