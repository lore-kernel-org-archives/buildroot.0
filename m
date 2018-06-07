From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jun 2018 15:50:29 +0200
Subject: [Buildroot] [PATCH 1/1] docker-containerd: add missing binary
 symlink
In-Reply-To: <CAGDkrv6D9avg7ps9j3PfBEwYNL-vNTQe2v-782A8u30Y6zB_fw@mail.gmail.com>
References: <CAGDkrv6D9avg7ps9j3PfBEwYNL-vNTQe2v-782A8u30Y6zB_fw@mail.gmail.com>
Message-ID: <20180607155029.20e88589@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution!

On Thu, 7 Jun 2018 08:51:07 +0100, Sam Lancia wrote:
> In 2dccb4f2fefd8a0dbda65dd0f7537f811e920b13,
> "/usr/bin/docker-containerd" was removed without replacing it with a
> symlink
> 
> https://bugs.busybox.net/show_bug.cgi?id=11076
> 
> Signed-off-by: Sam Lancia <sam@gpsm.co.uk>
> ---
>  package/docker-containerd/docker-containerd.mk | 1 +
>  1 file changed, 1 insertion(+)

Your patch was not applicable as-is, because it has been modified on
the way by your e-mail client. I've fixed this up because it was a
simple patch, but for future patches, it would be nice if you could use
"git send-email" to send the patches.

I've improved a bit the commit log, and applied your patch to master.
Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
