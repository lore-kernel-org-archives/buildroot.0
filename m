From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jun 2012 22:11:13 +0200
Subject: [Buildroot] [PATCH] added package sftpserver
In-Reply-To: <CABJxTWFdYodgaKy3vG03aJrxnerCrxTsjRPWm1q8U_XkQukz0w@mail.gmail.com>
References: <CABJxTWFdYodgaKy3vG03aJrxnerCrxTsjRPWm1q8U_XkQukz0w@mail.gmail.com>
Message-ID: <20120606221113.63a66610@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 4 Jun 2012 09:26:39 +0200,
Kiril Maler <kiril.maler@gmail.com> a ?crit :

> I see one (possible) reason to add sftp-server as part of openssh
> configuration and directory -
> if in the future there is any security patch, concerning also
> sftp-server source code file,
> then the security fix patch must be added in .../packages/openssh
> only. Most probably this will be fixed by
> moving to next openssh version.

That's the problem I have with your approach: when we want to upgrade
openssh, we will have to upgrade in two different places.

I would very much prefer to see a contribution made to openssh to get
the capability of building / installing only sftp-server, but I'm not
the Buildroot maintainer, so my opinion is just one amongst many
others :)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
