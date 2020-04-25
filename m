From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Apr 2020 09:03:13 +0200
Subject: [Buildroot] [git commit] package/gcc: fix check-package
In-Reply-To: <20200410192013.4AB618E244@busybox.osuosl.org> (Yann E. MORIN's
 message of "Fri, 10 Apr 2020 21:30:14 +0200")
References: <20200410192013.4AB618E244@busybox.osuosl.org>
Message-ID: <87pnbwujwu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=2a6003ddd5a495f5e580a5dc05d71705fd4da27a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit dcaf6e75a (package/gcc: pass -Wno-error to debug builds)
 > introduced non-ASCII characters in a comment, copy-pasted from a
 > terminal output.

 > check-package does not like non-ASCII characters, and whines about
 > them.

 > Replace the fancy quotes by standard ASCII ones.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
