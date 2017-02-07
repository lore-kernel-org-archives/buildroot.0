From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Feb 2017 20:47:42 +0100
Subject: [Buildroot] Interaction between SITE_METHOD=LOCAL and .patch
	files
In-Reply-To: <o7d0l8$c5k$1@blaine.gmane.org> (Grant Edwards's message of "Tue, 
 7 Feb 2017 17:37:45 +0000 (UTC)")
References: <o7araj$clq$1@blaine.gmane.org>
 <0a532bbd-e625-a41e-ece3-6974bd63d4a2@mind.be>
 <o7cvgb$209$1@blaine.gmane.org> <o7d0l8$c5k$1@blaine.gmane.org>
Message-ID: <87o9ydrdep.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

Hi,

 >>> Indeed, it should be documented. Care to send a patch?
 >> 
 >> Will do.

 > Is it just the .patch files found in the package directory that are
 > skipped in the [FOO_SITE_METHOD = local] case?  Or are all patches
 > skipped (also skipping those specified by FOO_PATCH and
 > BR2_GLOBAL_PATCH_DIR)?

All patches, it skips directly to to the configure step.

-- 
Bye, Peter Korsgaard
