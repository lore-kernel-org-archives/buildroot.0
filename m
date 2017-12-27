From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 10:46:17 +0100
Subject: [Buildroot] [git commit] package/checkpolicy: rename variable
In-Reply-To: <20171201214727.D9972811B6@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Fri, 1 Dec 2017 22:48:09 +0100")
References: <20171201214727.D9972811B6@busybox.osuosl.org>
Message-ID: <87bmiktseu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=d9f771b9020bda091804fdc3ff75a2d5b18a0e6c
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > We use package names as poor-man's namespace, so fix that.

 > Reported by utils/check-package.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Adam Duskett <aduskett@gmail.com>
 > Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 > Cc: Matt Weber <matthew.weber@rockwellcollins.com>
 > [Thomas: use CHECKPOLICY_MAKE_OPTS instead of
 > CHECKPOLICY_TARGET_MAKE_OPTS, as it is more consistent with
 > HOST_CHECKPOLICY_MAKE_OPTS being used for the host variant.]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
