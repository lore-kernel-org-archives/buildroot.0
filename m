From: Christian Stewart <christian@paral.in>
Date: Sun, 15 Jul 2018 21:04:57 -0700
Subject: [Buildroot] [PATCH v4 3/3] docker-engine: split into
 docker-{cli, engine}, bump v2018.06-ce-rc3
In-Reply-To: <20180716034058.wju3oo324cg2tiyz@sapphire.tkos.co.il>
References: <20180715224340.30282-1-christian@paral.in>
 <20180715224340.30282-3-christian@paral.in>
 <20180716034058.wju3oo324cg2tiyz@sapphire.tkos.co.il>
Message-ID: <CA+h8R2rHpbPVbmia4MnPURLJwSe+uKvntAPNUkGtpUVJ1W84xQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Sun, Jul 15, 2018 at 8:41 PM Baruch Siach <baruch@tkos.co.il> wrote:

> >               GITCOMMIT="$$(echo $(DOCKER_ENGINE_COMMIT) | head -c7)" \
>
> .. but still used it here.
>

Same rebase artifact as in docker-containerd, this line can be deleted.

Thanks,
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180715/0f7c1131/attachment.html>
