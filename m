From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 23:14:47 +0100
Subject: [Buildroot] [git commit] package/kf5-kcoreaddons: fix
 check-package warnings
In-Reply-To: <20191222094810.736238D4B7@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 22 Dec 2019 10:57:14 +0100")
References: <20191222094810.736238D4B7@busybox.osuosl.org>
Message-ID: <87eewuu1t4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=f7e750e8f514f84bf2f4fc99976dd11f19c8ecbc
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > KF5_KCOREADDONS_CONF_OPTS is set both outside and inside the
 > conditional block, so the value set outside would be lost if
 > the condition were to be true.

 > Use append-assignement in this case, as reported by check-package.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
