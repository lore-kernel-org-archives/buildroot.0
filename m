From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Jun 2021 23:18:36 +0200
Subject: [Buildroot] [git commit] package/nginx: add upstream
 CVE-2021-23017 security fix
In-Reply-To: <20210528120731.642648AF1F@busybox.osuosl.org> (Yann E. MORIN's
 message of "Fri, 28 May 2021 14:36:39 +0200")
References: <20210528120731.642648AF1F@busybox.osuosl.org>
Message-ID: <87k0n2n3df.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=ab9ceea782c770acdb9a25d8601b12af261c8ccb
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes the following vulnerability:

 > - CVE-2021-23017: 1-byte memory overwrite in resolver

 > For more details, see the advisories:
 > https://mailman.nginx.org/pipermail/nginx-announce/2021/000300.html
 > https://www.openwall.com/lists/oss-security/2021/05/25/5

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > [yann.morin.1998 at free.fr: annotate the patch, that it is a backport]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
