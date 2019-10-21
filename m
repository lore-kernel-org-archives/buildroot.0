From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 16:31:41 +0200
Subject: [Buildroot] [PATCH] package/qemu: fix crash with uClibc-ng
In-Reply-To: <CAJ4jsaf9-z_3=4pcjqAHmzdAvLF9t6xfwjyjnO=fuyFY8z1G5g@mail.gmail.com>
References: <20191019020928.2931-1-unixmania@gmail.com>
 <20191020162636.16c339ae@windsurf.home>
 <CAJ4jsaf9-z_3=4pcjqAHmzdAvLF9t6xfwjyjnO=fuyFY8z1G5g@mail.gmail.com>
Message-ID: <20191021163141.1e157b04@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Oct 2019 11:28:55 -0300
Carlos Santos <unixmania@gmail.com> wrote:

> > >  ...fix-crash-when-compiling-with-uClibc.patch | 43 +++++++++++++++++++
> > >  1 file changed, 43 insertions(+)
> > >  create mode 100644 package/qemu/3.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch  
> >
> > Applied to master, thanks.
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com  
> 
> Still appears as "New" in patchwork: https://patchwork.ozlabs.org/patch/1179727/

Thanks for reporting, I fixed the patch state. I guess I got distracted
by some $reallife interruption :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
