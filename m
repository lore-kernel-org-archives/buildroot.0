From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Jun 2014 09:10:04 +0200
Subject: [Buildroot] psplash and systemd
In-Reply-To: <20140611211821.GB2825@ned>
References: <537C657F.4090106@ebo-enterprises.com> <20140521192928.GA3672@ned>
 <20140609142734.32d58a30@free-electrons.com>
 <20140611211821.GB2825@ned>
Message-ID: <20140612091004.182d10d5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Wed, 11 Jun 2014 23:18:21 +0200, Eric Le Bihan wrote:

> > Can you submit this patch properly, i.e with git send-email, so that it
> > can be applied?
> I posted a proper patch.

Ok, found at http://patchwork.ozlabs.org/patch/358888/.

> As for adding progress report from systemd to
> psplash, this would require a patch to src/core/manager.c in systemd to write
> to psplash socket.

Ok.

> BTW, maybe we should provide a patch to set the default image with the famous
> Buildroot hard hat, to replace the "POKY" theme...

Indeed, that would be good to have.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
