From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Aug 2012 13:53:23 +0200
Subject: [Buildroot] dropbear permission denied
In-Reply-To: <3C32AECB8207924A9A228348325DB2D29050F1@mntserv.meier-nt.local>
References: <8E7CEF5A14A94EDF90F261B9ED2FC9E6@meiernt.local>
 <3C32AECB8207924A9A228348325DB2D29050F1@mntserv.meier-nt.local>
Message-ID: <20120824135323.654eb15b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 24 Aug 2012 08:56:32 +0200,
"Dirk Lohse" <d.lohse@meier-nt.de> a ?crit :

> ssh/dropbear doesn't work without password (right?). I've created a
> password for root and it works. If not - maybe there is another
> problem. When target-fs is mounted read-only you should get another
> failure.

Correct. dropbear doesn't allow login into accounts that have an empty
password.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
