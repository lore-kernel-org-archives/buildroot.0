From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Jun 2021 23:18:16 +0200
Subject: [Buildroot] [git commit] package/libcurl: security bump to
 version 7.77.0
In-Reply-To: <20210528115121.CA5A187A45@busybox.osuosl.org> (Yann E. MORIN's
 message of "Fri, 28 May 2021 14:19:33 +0200")
References: <20210528115121.CA5A187A45@busybox.osuosl.org>
Message-ID: <87o8cen3dz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=eae15d62c6a857f43d6f21af9a30f38994b3efc5
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes the following security issues:

 > - CVE-2021-22897: schannel cipher selection surprise
 >   https://curl.se/docs/CVE-2021-22897.html

 > - CVE-2021-22898: TELNET stack contents disclosure
 >   https://curl.se/docs/CVE-2021-22898.html

 > - CVE-2021-22901: TLS session caching disaster
 >   https://curl.se/docs/CVE-2021-22901.html

 > Unconditionally disable the ldap(s) options.  These require external
 > libraries, but the options were ignored if the needed libraries weren't
 > available. This is now changed to be a fatal error since

 > https://github.com/curl/curl/commit/dae382a1a1481a94b708c82d5aa9fa7253084160

 > Additionally, add a post-7.77.0 upstream patch to fix compilation with
 > bearssl.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > [yann.morin.1998 at free.fr: annotate the patch, that it is a backport]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
