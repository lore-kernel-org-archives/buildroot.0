From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Fri, 20 Feb 2015 16:58:27 +0100
Subject: [Buildroot] [PATCH] package/openvmtools: enable openvmtools
 kernel modules
In-Reply-To: <20150220092207.1ee858a9@free-electrons.com>
References: <1424388046-30299-1-git-send-email-romain.naour@openwide.fr>
 <20150220092207.1ee858a9@free-electrons.com>
Message-ID: <CABbD_XDv+4QbdY7-n5CDK3BuF7c3yQuA0c-2Ke2s3oG5VquMbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain, Thomas,

AFAIK all openvmtools kernel modules are upstreamed into recent vanilla
Linux kernels (except HGFS, which shall come into fuse in the near future),
so I think this patch should contain a warning, to only build the kernel
modules if you are building an old kernel. This is the reason why I didn't
bother with this when I first sent in the package.
See a very recent conversation on
http://sourceforge.net/p/open-vm-tools/mailman/message/33471984/

Kind regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150220/f25bf8cd/attachment.html>
