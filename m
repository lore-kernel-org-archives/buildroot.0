From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 20:59:25 +0100
Subject: [Buildroot] [PATCH 0/3] Kconfig fixes
In-Reply-To: <20181028230952.27293-1-petr.vorel@gmail.com> (Petr Vorel's
 message of "Mon, 29 Oct 2018 00:09:49 +0100")
References: <20181028230952.27293-1-petr.vorel@gmail.com>
Message-ID: <875zxjfboi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

 > Hi,
 > here are fixes of my last kconfig update.
 > 6eacea5ae0 ("support/kconfig: bump to kconfig from Linux 4.17-rc2")

 > I left patch 17-backport-kecho.patch from v3 which got merged
 > and I accidentally deleted 2 changes which didn't have patches.

 > Erico, thanks for reporting bug.
 > Sorry for mistakes.


 > Kind regards,
 > Petr

 > Petr Vorel (3):
 >   kconfig: Add missing patch
 >   kconfig: Restore missing custom changes + add patches
 >   kconfig: Refresh patches

Committed all 3, thanks.

-- 
Bye, Peter Korsgaard
