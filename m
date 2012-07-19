From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jul 2012 22:08:25 +0200
Subject: [Buildroot] [PATCH 0/1] Makefile: add variable print
 capabilities
In-Reply-To: <1342724478-21701-1-git-send-email-emeric.vigier@savoirfairelinux.com>
References: <1342724478-21701-1-git-send-email-emeric.vigier@savoirfairelinux.com>
Message-ID: <20120719220825.584bfb03@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 19 Jul 2012 15:01:17 -0400,
Emeric Vigier <emeric.vigier@savoirfairelinux.com> a ?crit :

> I just got started with buildroot yesterday, and like it :-).
> I am no Makefile expert, then often I turn into wanting to check Makefile variables.
> This patch adds a capability to do so by issuing:
> 
> $ make print-<myvariable>
> 
> e.g.
> 
> $ make print-DL_DIR
> DL_DIR = /home/evigier/buildroot/dl

Hum, is this really useful? What are the use cases? What do other
thinks about this?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
