From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 15:04:15 +0200
Subject: [Buildroot] [PATCH 4/4] Package netsnmp: Added OK/FAIL output
In-Reply-To: <20160701123644.GB25487@free.fr>
References: <1456435484-4723-1-git-send-email-universeII@gmx.de>
 <1456435484-4723-4-git-send-email-universeII@gmx.de>
 <20160701123644.GB25487@free.fr>
Message-ID: <20160701150415.515459b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 1 Jul 2016 14:36:44 +0200, Yann E. MORIN wrote:

> > @@ -92,6 +98,7 @@ case "$1" in
> >      reload|force-reload)
> >          reload
> >          ;;
> > +  
> 
> Spurious empty line.

It's indeed not strictly related, but in all other cases of this
switch, there is an empty line separating cases. So I think it's good
to also have this one for consistency. It could have been in a separate
commit, but oh well, that was good enough.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
