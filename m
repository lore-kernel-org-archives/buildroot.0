From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:04:44 +0200
Subject: [Buildroot] [git commit] package/openfpgaloader: C++ dependency
 is not inherited
In-Reply-To: <20200823195346.5E569836F4@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 23 Aug 2020 21:51:27 +0200")
References: <20200823195346.5E569836F4@busybox.osuosl.org>
Message-ID: <874komr9ar.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=1ca0077d9141fff62c179bd2d17cfd6656a7d8a3
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > openfpgaloader is written in C++, so the dependency on C++ is not
 > inherited from libftdipp1.

 > Drop the confusing comment.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
