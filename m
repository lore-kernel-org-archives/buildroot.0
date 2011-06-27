From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jun 2011 14:22:40 +0200
Subject: [Buildroot] [PATCH] linux: Change patch matching string to
 allow all names. This allows the use of patches output by git format-patch.
In-Reply-To: <BANLkTikb9RCrHgJMYtaw1_d9K1j6bk=unw@mail.gmail.com>
References: <1308924529-32225-1-git-send-email-mike@mikebwilliams.com>
 <BANLkTikb9RCrHgJMYtaw1_d9K1j6bk=unw@mail.gmail.com>
Message-ID: <20110627142240.7454703d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 27 Jun 2011 09:10:02 +0200,
Daniel Nystr?m <daniel.nystrom@timeterminal.se> a ?crit :

> I have to disagree on this. There might be patches for other packages
> in that same dir.

I was initially tempted to ACK Mike's patch, because I have the same
use case than Mike's (using git format-patch and then copying patches
to the Buildroot board specific directory), but as Daniel says, there
may be patches for other components in the same directory.

Maybe we should simply document this in the option help text?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
