From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 20:45:34 +0200
Subject: [Buildroot] [git commit] Revert "package/assimp: fix musl
 zlib/zip related compile failure"
In-Reply-To: <20210520191635.749068889C@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Thu, 20 May 2021 21:45:23 +0200")
References: <20210520191635.749068889C@busybox.osuosl.org>
Message-ID: <87sg2d2ss1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=59cbf375856d9de6981e3d44b172dfa873ffa78b
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This reverts commit b529a582ba4d7671597e95d7ab54ee652cbbc261 as it
 > raises a build failure with hiawatha because assimp installs its own
 > zlib library in staging directory.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9cac31962d48245a5579da692dbc9488292a397e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
