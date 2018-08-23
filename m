From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 22:12:52 +0200
Subject: [Buildroot] [git commit] ghostscript: set correct font path on
 target
In-Reply-To: <20180728215530.1578D8A5E3@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Sat, 28 Jul 2018 23:57:10 +0200")
References: <20180728215530.1578D8A5E3@busybox.osuosl.org>
Message-ID: <87r2io2663.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=a76eab228f0bde8597bb6431733e3e1a8d25f806
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > GHOSTSCRIPT_FONTS_TARGET_DIR is set to $(TARGET_DIR)/usr/share/fonts/gs
 > in ghostscript-fonts.mk. If we pass this full path to ghostscript, it
 > will look for fonts in $(TARGET_DIR), which doesn't exist on the
 > target.

 > Instead of /usr/share/fonts/gs, use /usr/share/fonts so ghostscript can
 > also access other fonts than the ones installed by ghostscript-fonts.

 > Signed-off-by: Thomas Ehrhardt <tehrhardt@innovaphone.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
