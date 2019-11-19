From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Nov 2019 09:05:35 +0100
Subject: [Buildroot] [git commit] package/neardal: unconditionally use
 libedit
In-Reply-To: <20191114214717.BFAE9814BC@busybox.osuosl.org> (Yann E. MORIN's
 message of "Thu, 14 Nov 2019 22:52:46 +0100")
References: <20191114214717.BFAE9814BC@busybox.osuosl.org>
Message-ID: <87zhgsnve8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=93e9b5378d8ed6c67caf0aa9aca18b65d0ce0b45
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > neardal is licensed under LGPL-2.0, which is (most likely) not license
 > compatible with readline (GPL-3.0+), so always use the libedit backend.

 > The choice is done by ./configure, which first checks for libedit, and
 > uses readline only as a fallback. Since we do build libedit before
 > neardal, that's what is going to be picked up.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > [yann.morin.1998 at free.fr:
 >   - add blurb about preference in ./configure
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
