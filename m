From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 14:27:34 +0200
Subject: [Buildroot] psplash and systemd
In-Reply-To: <20140521192928.GA3672@ned>
References: <537C657F.4090106@ebo-enterprises.com> <20140521192928.GA3672@ned>
Message-ID: <20140609142734.32d58a30@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Wed, 21 May 2014 21:29:28 +0200, Eric Le Bihan wrote:
> Hi!
> 
> On Wed, May 21, 2014 at 10:36:15AM +0200, Tom Deblauwe wrote:
> > Hello,
> >
> > I am using psplash in my initramfs and it shows up a graphical
> > bootscreen, but then the regular bootprocess starts and there I would
> > like to continue showing the splash screen. I am using the 6d3336a
> > commit of master buildroot. So I would like to use systemd. What is the
> > best solution for this?
> 
> Please find attached a patch that installs two new services for using psplash
> with systemd. These are inspired by the ones from Plymouth
> (http://cgit.freedesktop.org/plymouth/tree/systemd-units/):

Can you submit this patch properly, i.e with git send-email, so that it
can be applied?

I'll mark it as "Changes requested" in patchwork in the mean time,
awaiting for your new posting.

Thanks a lot, having psplash integration looks really useful!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
