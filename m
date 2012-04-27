From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Apr 2012 16:35:06 +0200
Subject: [Buildroot] [Bug 5138] New: Add dropbear config option to allow
 blank passwords
In-Reply-To: <jn9jsk$fob$1@dough.gmane.org>
References: <bug-5138-163@https.bugs.busybox.net/>
 <20120425141823.GB20601@game.jcrosoft.org>
 <jn9jsk$fob$1@dough.gmane.org>
Message-ID: <20120427163506.4e0a7ba2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 Apr 2012 19:39:02 +0000 (UTC),
Grant Edwards <grant.b.edwards@gmail.com> a ?crit :

> > this is a security issue
> 
> Only if you set it (it defaults to "n") and the device in question is
> on an accessible network.
> 
> > I prefer to add an option to add a default ssh public key
> 
> That doesn't do the same thing.
> 
> > I've a patch somewhere
> 
> I've no objection to having an option for a default key, but I don't
> think it's buildroot's place to try to decide and enforce security
> policies.  Those decisions belong to the person specifying and
> designing the embedded system.
> 
> [Not allowing blank passwords in dropbear seems especially silly when
> blank passwords are allowed by telnetd, login and openssh.]

Agreed. I think both the "Allow blank passwords" option and the "Add
default ssh public key" options make sense, and they both should be
added.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
