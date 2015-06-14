From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 23:26:04 +0200
Subject: [Buildroot] [PATCHv2 15/15] fs/iso9660: add support for grub2
In-Reply-To: <20150614155643.GN3615@free.fr>
References: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433802108-14351-16-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150614155643.GN3615@free.fr>
Message-ID: <20150614232604.353463fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 14 Jun 2015 17:56:43 +0200, Yann E. MORIN wrote:

> > @@ -0,0 +1,7 @@
> > +set default="0"
> > +set timeout="5"
> 
> For grub, the timeout is 10s. I don't mind which value we use, I don't
> even really mind they differ, but do we maybe want some consistency? ;-)

I've switched to a 10 seconds timeout before committing.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
