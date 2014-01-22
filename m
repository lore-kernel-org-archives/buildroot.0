From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Jan 2014 22:40:34 +0100
Subject: [Buildroot] [PATCH v3] added python unicode selection to menu
In-Reply-To: <1389155647-17521-1-git-send-email-mlweber1@rockwellcollins.com>
 (Matt Weber's message of "Tue, 7 Jan 2014 22:34:07 -0600")
References: <1389155647-17521-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <87bnz3d7al.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <mlweber1@rockwellcollins.com> writes:

 > From: Matthew Weber <mlweber1@rockwellcollins.com>
 > This patch is based on the original new pkg patch submitted last Jan
 > and is part of the "Patchwork oldest patches cleanup #5".

 > Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
 > --

 > Changes v2 -> v3:
 >  - Removed host-python unicode configuration
 >    (No usecase and host doesn't have to match target) Suggested by Thomas P.

 > Changes v1 -> v2:
 >  - None, resubmit after testing against current tip.
 
 > +# Default is UCS2 w/o a conf opt
 > +ifeq ($(BR2_PACKAGE_PYTHON_UCS4),y)
 > +PYTHON_CONF_OPT      += --enable-unicode=ucs4

Committed with the extra whitespace after _CONF_OPT fixed, thanks.

-- 
Bye, Peter Korsgaard
