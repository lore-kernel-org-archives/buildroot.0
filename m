From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Mar 2012 09:06:13 +0100
Subject: [Buildroot] [PATCH] Fix microperl
In-Reply-To: <871up5o277.fsf@macbook.be.48ers.dk>
References: <1330895345-16705-1-git-send-email-arnout@mind.be>
 <871up5o277.fsf@macbook.be.48ers.dk>
Message-ID: <20120307090613.3b8e4a9a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 06 Mar 2012 22:21:32 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Well, I think getting rid of it would be a pity, but I don't
> personally use perl so if nobody else is using it? Gustavoz?

Gustavo has a patch that does the conversion to GENTARGETS, he even
posted it on the list at:

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
To: buildroot at busybox.net
Subject: [Buildroot] [PATCHv3] [RFC] microperl: bump to version 5.12.3 and convert to gentargets
Date: Tue, 17 May 2011 15:22:39 -0300

There was only one remaining issue: on a Ubuntu 64 bits host, the build
was failing. But I think it also fails in the current state, so the
patch that converts to GENTARGETS could be merged, and the building
problem on Ubuntu 64 bits solved later.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
