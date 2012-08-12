From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Aug 2012 17:18:30 +0200
Subject: [Buildroot] [PATCH] PAM support in Busybox if linux-pam is built
In-Reply-To: <CADiAo4KjWJUV9A2HrTeuddW3+mqib0UsTnmaoJWigwzfC9Wohw@mail.gmail.com>
References: <1344740623-29446-1-git-send-email-golubovsky@gmail.com>
 <20120812141726.GP21035@sapphire.tkos.co.il>
 <CADiAo4KjWJUV9A2HrTeuddW3+mqib0UsTnmaoJWigwzfC9Wohw@mail.gmail.com>
Message-ID: <20120812171830.6609bc25@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 12 Aug 2012 10:25:46 -0400,
Dmitry Golubovsky <golubovsky@gmail.com> a ?crit :

> What would you suggest: to drop "if unsure..." or to make PAM disabled
> by default in busybox?

Make PAM disabled by default *and* provide basically working versions
of the /etc/pam.d/ files that are needed to make the login process
working if Busybox is built with PAM support. That's something we
generally try to do with Buildroot: ensure that when a package is built
and installed, it has default configuration files that allow it to work
in at least a basic way.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
