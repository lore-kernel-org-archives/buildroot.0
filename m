From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:02:26 +0200
Subject: [Buildroot] [git commit] linux: use host pkg-config when host
 libelf is set
In-Reply-To: <20190413150427.859258A58E@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Sat, 13 Apr 2019 17:07:10 +0200")
References: <20190413150427.859258A58E@busybox.osuosl.org>
Message-ID: <87y33z894d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=615e2edc2ae8351519448d1965f0c4eec4e793b1
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > A patch was added to the Linux kernel in 5.1.0-rc3 which adds a
 > requirement that the host build environment include pkg-config. Add the
 > correct host-pkgconf dependency and environment variables to ensure
 > Linux picks up the correct libraries.

 > Move the existing LINUX_MAKE_ENV assignment earlier, to simplify the
 > append-assignment in the libelf conditional block.

 > Fixes: #11761

 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > [Arnout: extend commit message as suggested by Yann]
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
