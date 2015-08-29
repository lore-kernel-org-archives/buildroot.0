From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 11:36:07 +0200
Subject: [Buildroot] [PATCH 1/1] Fix umask settings for non-bash shells
 for root user
In-Reply-To: <20150829093317.GB4857@free.fr>
References: <1434378026-15007-1-git-send-email-vorel@jablocom.com>
 <20150829105707.3d5e0fec@free-electrons.com>
 <20150829092037.GA4857@free.fr>
 <20150829112955.3a6b8d77@free-electrons.com>
 <20150829093317.GB4857@free.fr>
Message-ID: <20150829113607.53818ac4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 29 Aug 2015 11:33:17 +0200, Yann E. MORIN wrote:

> > > And maybe provide a simple .profile *iff* needed.
> > 
> > Can you check if a .profile is really needed? If so, can you submit a
> > patch series cleaning up .bash_* ?
> 
> After the release, maybe?

Absolutely, this is post 2015.08 stuff.

> > Why? Git doesn't track empty directories, so we have those .empty files
> > all over the place. I don't see what would recreate the root/ directory
> > for the root user if we don't keep it in the skeleton. Am I missing
> > something?
> 
> Right. I was thinking of keeping a .profile in that directory. If there
> is a .profile, there is no need for .empty . If there is no .profile
> (and no other file), we need to keep .empty , yes.

Ah, ok, I see. We're on the same line then. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
