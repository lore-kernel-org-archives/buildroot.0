From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Dec 2013 22:14:45 +0100
Subject: [Buildroot] [PATCH] apf27: update configuration
In-Reply-To: <1387138008-7830-1-git-send-email-tremyfr@yahoo.fr> (Philippe
 Reynes's message of "Sun, 15 Dec 2013 21:06:48 +0100")
References: <1387138008-7830-1-git-send-email-tremyfr@yahoo.fr>
Message-ID: <87y53lu88q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Philippe" == Philippe Reynes <tremyfr@yahoo.fr> writes:

 > - move kernel 3.8.3 to 3.12.5
 > - enable pwm_imx in the kernel configuration
 > - add u-boot

 > Acked-by: Eric Jarrige <eric.jarrige@armadeus.org>
 > Acked-by: Julien Boibessot <julien.boibessot@armadeus.com>
 > Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
 > ---
 >  board/armadeus/apf27/linux-3.12.config |  230 ++++++++++++++++++++++++++++++++
 >  board/armadeus/apf27/linux-3.8.config  |  229 -------------------------------
 >  configs/armadeus_apf27_defconfig       |   12 +-
 >  3 files changed, 238 insertions(+), 233 deletions(-)
 >  create mode 100644 board/armadeus/apf27/linux-3.12.config
 >  delete mode 100644 board/armadeus/apf27/linux-3.8.config

Committed, thanks.

Please enable rename detection in git for future patches, that would
have made this patch a lot smaller (E.G. easier to review).

You can do something like this to enable it globally:

git config --global diff.renames copy

-- 
Bye, Peter Korsgaard
