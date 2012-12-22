From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Dec 2012 00:27:19 +0100
Subject: [Buildroot] [PATCH 2/6] polkit: new package
In-Reply-To: <CAAfyv37M7Ogi4bhv4Qoxf0-0xVHVGP6sjL+J66R2xJ8BTQNoqQ@mail.gmail.com>
References: <1356126670-16186-1-git-send-email-marek.belisko@open-nandra.com>
 <1356126670-16186-3-git-send-email-marek.belisko@open-nandra.com>
 <20121222161826.05b661e3@skate>
 <CAAfyv37M7Ogi4bhv4Qoxf0-0xVHVGP6sjL+J66R2xJ8BTQNoqQ@mail.gmail.com>
Message-ID: <20121223002719.3d934cf0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Belisko Marek,

On Sat, 22 Dec 2012 22:54:03 +0100, Belisko Marek wrote:

> >> +POLKIT_INSTALL_STAGING = YES
> >
> > I don't remember, does polkit installs some libraries or .pc files, or
> > something that justify its installation in staging ?
> Yes. In staging there are added 3 libraries with polkit-agent-1.pc
> polkit-backend-1.pc polkit-gobject-1.pc files.

Ok, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
