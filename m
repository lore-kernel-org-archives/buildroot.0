From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 05 Jun 2014 08:45:16 +0200
Subject: [Buildroot] [PATCH v6 0/4] rpi-userland/xbmc fixes
In-Reply-To: <1401923053-30292-1-git-send-email-s.martin49@gmail.com>
References: <1401923053-30292-1-git-send-email-s.martin49@gmail.com>
Message-ID: <a8809a02-4f3d-4671-a9dc-0c251445c498@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

(Grr... K9 drops the text in the quoted part)

You forgot to propagate my tested-and-acked-tags to patches 1 and 3.

Regards,
Yann E  MORIN.

On June 5, 2014 1:04:09 AM CEST, Samuel Martin <s.martin49@gmail.com> wrote:
>Hi all,
>
>Here is just more fixes about rpi-userland/xbmc and all.
>
>Yours,
>Samuel
>
>Samuel Martin (3):
>  xbmc: fix missing libraries from rpi-userland
>  rpi-userland: add patch fix missing libvcilcs install rules
>  rpi-userland: cleanup *_CONF_OPT
>
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140605/3cba6747/attachment.html>
