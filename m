From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jun 2012 16:26:09 +0200
Subject: [Buildroot] [PATCH] [ARM] Add dtb image generation
In-Reply-To: <1340453490-10005-1-git-send-email-tremyfr@yahoo.fr>
References: <1340453490-10005-1-git-send-email-tremyfr@yahoo.fr>
Message-ID: <20120623162609.7bdc23d9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 23 Jun 2012 14:11:30 +0200,
Philippe Reynes <tremyfr@yahoo.fr> a ?crit :

> Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>

My colleague Maxime has posted yesterday something, which, even though
not fully complete, provides more possibilities than this proposal (for
example it supports generating kernel images that directly include the
DTB, as is used these days on ARM when the platform does not have a DT
capable bootloader). Would you mind testing his proposal?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
