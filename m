From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 21:10:21 +0200
Subject: [Buildroot] [git commit] package/tvheadend: fix PIE build
 failures
In-Reply-To: <20190620143534.4C51A82A89@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 20 Jun 2019 16:36:06 +0200")
References: <20190620143534.4C51A82A89@busybox.osuosl.org>
Message-ID: <877e9an6jm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=dd0907d465a0d82a4844e7aaf3eb3be69103642b
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Package tvheadend builds using '-pie' linker flag in any case. This
 > leads to linking failure if toolchain doesn't support 'pie'.

 > Add patch to fix tvheadend's Makefile bug where '-pie' flag is hardcoded
 > making it depend on '--disable-pie' as compiler's flags already are
 > treated.

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
